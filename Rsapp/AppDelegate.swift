//
//  AppDelegate.swift
//  Rsapp
//
//  Created by Guest03 on 7/11/18.
//  Copyright © 2018 Guest03. All rights reserved.
//

import UIKit
import Firebase
import OneSignal

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let APP_ID = "7771841A-1875-9C7F-FF07-379F72835300"
    let API_KEY = "A9A35779-6B5C-F851-FFC4-B739FDDCEE00"
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        backendless!.initApp(APP_ID, apiKey: API_KEY)
        OneSignal.initWithLaunchOptions(launchOptions, appId: kONESIGNALAPPID, handleNotificationReceived: nil, handleNotificationAction: nil, settings: nil)
        
        //user > posting notification login
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                if UserDefaults.standard.object(forKey: kCURRENTUSER) != nil{
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "userDidLoginNotification"), object: nil, userInfo: ["userId" : FUser.currentId()])
                    }
                }
            }
        }
        
        func onUserDidLogin(userId: String){
            //start oneSignal func from below
            startOneSignal()
            
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "userDidLoginNotification"), object: nil, queue: nil) { (note) in
            
            let userId = note.userInfo!["userId"] as! String
            UserDefaults.standard.set(userId, forKey: "userId")
            UserDefaults.standard.synchronize()
            
            onUserDidLogin(userId: userId)
        }
        
        if #available(iOS 10.0, *){
            
            let center = UNUserNotificationCenter.current()
            
            center.requestAuthorization(options: [.badge, .alert, .sound]) { (grated, error) in
                
            }
            application.registerForRemoteNotifications()
        }
        
        return true
        
    }
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data){
        
        Auth.auth().setAPNSToken(deviceToken, type: .prod)
        //.sandbox
        //.prod
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        if Auth.auth().canHandleNotification(userInfo){
            completionHandler(.noData)
            return
        }
        //this is not firebase notification
        func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error){
            
            print("Failed to register for user notification")
            
        }
        //MARK: OneSignal
        
        func startOneSignal() {
            
            let status: OSPermissionSubscriptionState = OneSignal.getPermissionSubscriptionState()
            
            let userID = status.subscriptionStatus.userId
            let pushToken = status.subscriptionStatus.pushToken
            
            //check if we  have pushToken
            if pushToken != nil {
                if let playerId = userID {
                    UserDefaults.standard.set(playerId, forKey: "OneSignalId")
                }else{
                    UserDefaults.standard.removeObject(forKey: "OneSignalId")
                }
            }
            //save to our user object
        }
            
    }
}//end of class
    
    


    

        

    
    //different function below/////////////

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }





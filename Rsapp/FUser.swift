//
//  FUser.swift
//  Rsapp
//
//  Created by Guest03 on 7/17/18.
//  Copyright © 2018 Guest03. All rights reserved.
//

import Foundation
import Firebase

class FUser{

    let objectId: String
    var pushId: String?
    
    var createdAt: Date
    var updatedAt: Date
    
    var coins: Int
    var company: String
    var firstName: String
    var lastName: String
    var fullName: String
    var avatar: String
    var phoneNumber: String
    var additionalPhoneNumber: String
    var isAgent: Bool
    var favoriteProperty:[String]
    
    init(_objectId: String, _pushId: String?, _createdAt: Date, _updatedAt: Date, _firstNane: String, _lastName: String, _avatar: String = "", _phoneNumber: String = "") {
    
    objectId = _objectId
    pushId = _pushId
        
    createdAt = _createdAt
    updatedAt = _updatedAt
        
    coins = 10
    firstName = _firstNane
    lastName = _lastName
    fullName = _firstNane + "" + _lastName
    avatar = _avatar
    isAgent = false
    company = ""
    favoriteProperty = []
    phoneNumber = _phoneNumber
    additionalPhoneNumber = ""
        
    }
    init(_dictionry: NSDictionary) {

        objectId = _dictionry[kOBJECTID] as! String
        pushId = _dictionry[kPUSHID] as? String
        
        if let created = _dictionry[kCREATEDAT] {
            createdAt = dateFormatter().date(from: created as! String)!
        }else{
            createdAt = Date()
        }
        
        if let updated = _dictionry[kUPDATEDAT] {
            updatedAt = dateFormatter().date(from: updated as! String)!
        }else{
            updatedAt = Date()
        }
        if let dcoin = _dictionry[kCOINS] {
            coins = dcoin  as! Int
        }else{
            coins = 0
        }
        if let comp = _dictionry[kCOMPANY] {
            company = comp  as! String
        }else{
            company = ""
        }
        if let fname = _dictionry[kFIRSTNAME] {
            firstName = fname  as! String
        }else{
            firstName = ""
        }
        if let lname = _dictionry[kLASTNAME] {
            lastName = lname  as! String
        }else{
            lastName = ""
        }
        fullName = firstName + "" + lastName
        if let avat = _dictionry[kAVATAR] {
            avatar = avat  as! String
        }else{
            avatar = ""
        }
        if let agent = _dictionry[kISAGENT] {
            isAgent = agent  as! Bool
        }else{
            isAgent = false
        }
        if let phone = _dictionry[kPHONE] {
            phoneNumber = phone  as! String
        }else{
            phoneNumber = ""
        }
        if let addphone = _dictionry[kADDPHONE] {
            additionalPhoneNumber = addphone  as! String
        }else{
            additionalPhoneNumber = ""
        }
        if let favPro = _dictionry[kFAVORITE] {
            favoriteProperty = favPro  as! [String]
        }else{
            favoriteProperty = []
        }
    }
    class func currentId() -> String {
        return Auth.auth().currentUser!.uid
    }
    
    class func currentUser() -> FUser?{
        if Auth.auth().currentUser != nil{
            if let dictionary = UserDefaults.standard.object(forKey: kCURRENTUSER){
                
                    return FUser.init(_dictionry: dictionary as! NSDictionary)
            }
        }
        return nil
    }
    class func registerUserWith(email:String, password:String, firtName:String, lastName:String, complition:@escaping (_ error: Error?)-> Void){
        
       
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            
        //}
        //Auth.auth().createUser(withEmail: email, password: password) { (firUser, error) in
            if error != nil{
                complition(error)
                return
           }
            let fUser = FUser(_objectId: (authDataResult?.user.uid)!, _pushId: "", _createdAt: Date(), _updatedAt: Date(), _firstNane: firtName, _lastName: lastName)
            
            saveUserLocally(fUser: fUser)
            saveUserInBackground(fUser: fUser)
            
            complition(error)
            
        }
        
    }
    
}//end of class

//MARK: Saving User

func saveUserInBackground(fUser: FUser){
    
    let ref = firebase.child(kUSER).child(fUser.objectId)
    ref.setValue(userDictionaryFrom(user: fUser))
}

func saveUserLocally(fUser: FUser){
    
    UserDefaults.standard.set(userDictionaryFrom(user: fUser), forKey:kCURRENTUSER)
    UserDefaults.standard.synchronize()
}


//MARK: helper function

func userDictionaryFrom(user: FUser) ->NSDictionary{
    let createdAt = dateFormatter().string(from: user.createdAt)
    let updatedAt = dateFormatter().string(from: user.updatedAt)
    
    return NSDictionary(objects: [user.objectId, createdAt, updatedAt, user.company, user.pushId!, user.firstName, user.lastName, user.fullName,user.avatar, user.phoneNumber, user.additionalPhoneNumber, user.isAgent, user.coins, user.favoriteProperty], forKeys: [kOBJECTID as NSCopying, kCREATEDAT as NSCopying,kUPDATEDAT as NSCopying,kCOMPANY as NSCopying ,kPUSHID as NSCopying ,kFIRSTNAME as NSCopying ,kLASTNAME as NSCopying,kFULLNAME as NSCopying ,kAVATAR as NSCopying ,kPHONE as NSCopying ,kADDPHONE as NSCopying,kISAGENT as NSCopying,kCOINS as NSCopying,kFAVORITE as NSCopying])
}


















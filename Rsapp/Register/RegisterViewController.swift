//
//  RegisterViewController.swift
//  Rsapp
//
//  Created by Guest03 on 7/12/18.
//  Copyright © 2018 Guest03. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    //phone registration
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var requestButtonOutlet: UIButton!
    
    //Email registration
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var phoneNumber: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         //request code button
        
        
        
    }
   //email registration
    @IBAction func emailRegisterButtonPressed(_ sender: Any) {
        if emailTextField.text != "" && nameTextField.text != "" && lastNameTextField.text != "" && passwordTextField.text != ""{
            FUser.registerUserWith(email: emailTextField.text!, password: passwordTextField.text!, firtName: nameTextField.text!, lastName: lastNameTextField.text!) { (error) in
                if error != nil{
                    print(" Errro registering user with email: \(error?.localizedDescription)")
                    return
                }
                self.goToApp()
//                let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainVC")as! UITabBarController
//                self.present(mainView, animated: true, completion:nil)
            }
        }
        
    }
    // x button
    @IBAction func closedButtonPressed(_ sender: Any) {
        
        goToApp()
    }
    
    @IBAction func requestButtonPressed(_ sender: Any) {
        
        if phoneNumberTextField.text != ""{
            PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumberTextField.text!, uiDelegate: nil, completion: { (verificationID, error) in
                if error != nil{
                    print("error phone number \(error?.localizedDescription)")
                    return
                    
            }
                
                
              //  }
                
                self .phoneNumber = self.phoneNumberTextField.text!
                self.phoneNumberTextField.text = ""
                self.phoneNumberTextField.placeholder = self.phoneNumber!
                
                self.phoneNumberTextField.isEnabled = false
                self.codeTextField.isHidden = false
                self.requestButtonOutlet.setTitle("Register", for: .normal)
                
                UserDefaults.standard.set(verificationID, forKey: kVERIFICATIONCODE)
                UserDefaults.standard.synchronize()
            })
        }
    
        if codeTextField.text != ""{
            FUser.registerUserWith(phoneNumber: phoneNumber!, verificationCode: codeTextField.text!, completion:{ (error, shouldLogin) in
                
                if error != nil {
                    print("error \(error?.localizedDescription)")
                    return
                }
                if shouldLogin {
                    //go to main view
                    print("go to main view")
                }else{
                    //go to finish register view
                     print("go to register view")
                }
            })
            
        }
        
    }

    func goToApp() {
        
        let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainVC")as! UITabBarController
        self.present(mainView, animated: true, completion:nil)
        
    }
}//end of class
    
    //override func didReceiveMemoryWarning() {
     //   super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
   // }
    






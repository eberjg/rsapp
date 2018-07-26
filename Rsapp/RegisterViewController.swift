//
//  RegisterViewController.swift
//  Rsapp
//
//  Created by Guest03 on 7/12/18.
//  Copyright © 2018 Guest03. All rights reserved.
//

import UIKit

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
    





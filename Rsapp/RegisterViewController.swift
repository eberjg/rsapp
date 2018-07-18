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
    //@IBOutlet weak var requestButtonOutlet: UIButton!
    
    @IBOutlet weak var requestButtonOutlet: UIButton!
    //Email registration
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func registerButtonPressed(_ sender: Any) {
    }
    
    @IBAction func closedButtonPressed(_ sender: Any) {
        
        let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainVC")as! UITabBarController
        self.present(mainView, animated: true, completion:nil)
    }
    @IBAction func requestButtonPressed(_ sender: Any) {
    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation


}

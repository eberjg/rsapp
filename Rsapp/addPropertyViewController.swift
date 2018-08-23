//
//  addPropertyViewController.swift
//  Rsapp
//
//  Created by EberG on 8/22/18.
//  Copyright © 2018 Guest03. All rights reserved.
//

import UIKit

class addPropertyViewController: UIViewController {
    
    
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var referenceCodeTextField: UITextField!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var roomsTextField: UITextField!
    
    @IBOutlet weak var bathroomsTextField: UITextField!
    
    @IBOutlet weak var propertySizeTextField: UITextField!
    
    @IBOutlet weak var parkingTextField: UITextField!
    
    @IBOutlet weak var floorTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var advertismentTypeTextField: UITextField!
    
    @IBOutlet weak var buildYearTextField: UITextField!
    
    
    @IBOutlet weak var propertyTYpeTextField: UITextField!
    
    
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextView!
    
    //switches
    @IBOutlet weak var titleDeedsSwitch: UISwitch!
    @IBOutlet weak var centralHeatingSwitch: UISwitch!
    @IBOutlet weak var solarWetherHeatingSwitch: UISwitch!
    @IBOutlet weak var storeRoomsSwitch: UISwitch!
    @IBOutlet weak var airConditionerSwitch: UISwitch!
    @IBOutlet weak var furnishedSwitch: UISwitch!
    
    var user: FUser?
    
     var titleDeedsSwitchValue = false
     var centralHeatingSwitchValue = false
     var solarWetherHeatingSwitchValue = false
     var storeRoomsSwitchValue = false
     var airConditionerSwitchValue = false
     var furnishedSwitchValue = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this code will make the scrollview go up and down
        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: topView.frame.size.height)

        
    }
    
    //MARK: IBActions
    
    @IBAction func cameraButtonPressed(_ sender: Any) {

    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        //this will allow user to save 1 property only
        user = FUser.currentUser()!
        
        if !user!.isAgent {
            //check if user can post
        }else{
            save()
        }
    }
    
    
    @IBAction func mapPinButtonPressed(_ sender: Any) {
    }
    
    
    @IBAction func currentLocationButtonPressed(_ sender: Any) {
    }
    
    //MARK: Helper function
    func save() {
        
    
    if titleTextField.text != "" && referenceCodeTextField.text != "" && advertismentTypeTextField.text != "" && propertyTYpeTextField.text != "" && priceTextField.text != "" {
        
         //create new property
            
        }else {
            ProgressHUD.showError("error: missing required field")
        }
    }
    
    // Switches
    
    @IBAction func titleDeedSwitch(_ sender: Any) {
        titleDeedsSwitchValue = !titleDeedsSwitchValue
    }
    @IBAction func centralHeatingSwitch(_ sender: Any) {
        centralHeatingSwitchValue = !centralHeatingSwitchValue
    }
    @IBAction func solarWetherHeatingSwitch(_ sender: Any) {
        solarWetherHeatingSwitchValue = !solarWetherHeatingSwitchValue
    }
    @IBAction func storeRoomsSwitch(_ sender: Any) {
        storeRoomsSwitchValue  = !storeRoomsSwitchValue
    }
    @IBAction func airConditionerSwitch(_ sender: Any) {
        airConditionerSwitchValue = !airConditionerSwitchValue
    }
    @IBAction func furnishedSwitch(_ sender: Any) {
        furnishedSwitchValue = !furnishedSwitchValue
    }
    
    
}

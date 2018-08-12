//
//  Property.swift
//  Rsapp
//
//  Created by EberG on 8/12/18.
//  Copyright © 2018 Guest03. All rights reserved.
//

import Foundation

@objcMembers //this line code is foer swift 4 so we can add table to backendlessshould be test in DB

class Property: NSObject {
    
    var objectId: String?
    var referenceCode: String?
    var ownerId: String?
    var title: String?
    var numberOfRooms: Int = 0
    var numberOfBathrooms: Int = 0
    var size: Double = 0.0
    var balconySize: Double = 0.0
    var parking: Int = 0
    var floor: Int = 0
    var address: String?
    var city: String?
    var country: String?
    var propertyDescription: String?
    var latitud: Double = 0.0
    var longitude: Double = 0.0
    var advertismentType: String?
    var avaliableFrom: String?
    var imageLinks: String? // should be text in ther backendless, string is to short
    var buildYear: String?
    var price: Int = 0
    var propertyType: String?
    var titleDeeds: Bool = false
    var centralHeating: Bool = false
    var solarWaterHeating: Bool = false
    var airConditioner: Bool = false
    var storeRoom: Bool = false
    var isFurnished: Bool = false
    var isSold: Bool = false
    var inTopUntil: Date?
    
    //MARK: save Function
    
    func saveProperty() {
        
        let dataStore = backendless!.data.of(Property().ofClass())
        dataStore!.save(self)
    }
    
    func saveProperty(completion: @escaping (_ value: String)-> Void) {
        
        let dataStore = backendless!.data.of(Property().ofClass())
        dataStore!.save(self, response: { (result) in
            
            completion("Success")
            
        }) {(fault : Fault?) in
            completion(fault!.message)
            
        }
        
    }
    
}


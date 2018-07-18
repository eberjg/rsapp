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
    
    let createdAt: Data
    var updatedAt: Data
    
    var coins: Int
    var companyName: String
    var firstName: String
    var lastName: String
    var fullName: String
    var avatar: String
    var phoneNumber: String
    var additionalPhoneNumber: String
    var isAgent: Bool
    var favoriteProperty:[String]
    
    init(_objectId: String, _pushId: String?, _createdAt: Data, _updatedAt: Data, _firstNane: String, _lastName: String, _avatar: String = "", _phoneNumber: String = "") {
    
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
    companyName = ""
    favoriteProperty = []
    phoneNumber = _phoneNumber
    additionalPhoneNumber = ""
        
    }
    
    
}













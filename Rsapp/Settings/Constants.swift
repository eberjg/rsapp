//
//  Constants.swift
//  Rsapp
//
//  Created by Guest03 on 7/12/18.
//  Copyright © 2018 Guest03. All rights reserved.
//

import Foundation
import Firebase
var backendless = Backendless.sharedInstance()
var firebase = Database.database().reference()

//Ids and Keys
public let kONESIGNALAPPID = "268d5d45-b02c-403b-b686-9a2841f04820"

//FUser/firebase user
public let kOBJECTID = "objectId"
public let kUSER = "User"
public let kCREATEDAT = "createdAt"
public let kUPDATEDAT = "updatedAt"
public let kCOMPANY = "company"
public let kPHONE = "phone"
public let kADDPHONE = "addPhone"

public let kCOINS = "coins"
public let kPUSHID = "pushId"
public let kFIRSTNAME = "firstName"
public let kLASTNAME = "lastName"
public let kFULLNAME = "fullName"
public let kAVATAR = "avatar"
public let kISONLINE = "isOnline"
public let kCURRENTUSER = "currentUser"
public let kVERIFICATIONCODE = "firebase_verificationCode"
public let kISAGENT = "isAgent"
public let kFAVORITE = "favorite"

//property
public let kMAXIMAGENUMBER = 10
public let kRECENTPROPERTYLIMIT = 20

//FB NOTIFICATION



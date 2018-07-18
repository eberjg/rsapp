//
//  Settings.swift
//  Rsapp
//
//  Created by Guest03 on 7/17/18.
//  Copyright © 2018 Guest03. All rights reserved.
//

import Foundation
private let dateFormat  = "yyyymmddhhss"

func dateFormatter() -> DateFormatter {
    
   let dateFormatter = DateFormatter()
   DateFormatter.dateFormat = dateFormat
    
    return dateFormatter
    
}


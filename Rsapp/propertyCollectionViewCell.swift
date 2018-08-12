//
//  propertyCollectionViewCell.swift
//  Rsapp
//
//  Created by EberG on 8/12/18.
//  Copyright © 2018 Guest03. All rights reserved.
//

import UIKit

class propertyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var soldImageView: UIImageView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeButtonOutlet: UIButton!
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var bathroomLabel: UILabel!
    @IBOutlet weak var parkingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    func generateCell(property: Property) {
        
        titleLabel.text = property.title
        roomLabel.text = "\(property.numberOfRooms)"
        bathroomLabel.text = "\(property.numberOfBathrooms)"
        parkingLabel.text = "\(property.parking)"
        
        priceLabel.text = "\(property.price)"
        priceLabel.sizeToFit()
        
    }
    
    
    
    
    @IBAction func startButtonPressed(_ sender: Any) {
    }
    
    
}

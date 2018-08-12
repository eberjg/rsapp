//
//  RecentViewController.swift
//  Rsapp
//
//  Created by EberG on 8/12/18.
//  Copyright © 2018 Guest03. All rights reserved.
//

import UIKit

class RecentViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var properties: [Property] = []
    
    
    override func viewWillLayoutSubviews() {
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       //load properties
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK: collectionview data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)-> Int {
    
        return properties.count
    
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! propertyCollectionViewCell
        
        cell.generateCell(property: properties[indexPath.row])
        
        return cell
    }
    
    
    //MARK: IBaction
    
    @IBAction func mixerButtonPressed(_ sender: Any) {
    }
    
    

}

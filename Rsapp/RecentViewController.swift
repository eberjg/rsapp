//
//  RecentViewController.swift
//  Rsapp
//
//  Created by EberG on 8/12/18.
//  Copyright © 2018 Guest03. All rights reserved.
//

import UIKit

class RecentViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {  //UICollectionViewFlowLayout

    @IBOutlet weak var collectionView: UICollectionView!
    
    var properties: [Property] = []
    
    
    override func viewWillLayoutSubviews() {
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       //load properties
        loadProperties(limitNumber: kRECENTPROPERTYLIMIT)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK: collectionview data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)-> Int {
    
        return 1//properties.count
    
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! propertyCollectionViewCell
        
        //cell.generateCell(property: properties[indexPath.row])
        
        return cell
    }
    
    //MARK: CollectionView delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // show property
    }
    func collectionView(_ collectionView: UICollectionView, layout collectioViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width, height: CGFloat(254))
            }
    
    //MARK: load property
    
    func loadProperties(limitNumber: Int) {
        Property.fetchResentPropperties(likitNumber: limitNumber) { (allProperties) in
            
            if allProperties.count != 0 {
                self.properties = allProperties as! [Property]
                self.collectionView.reloadData()
            }
        }
        
    }
    
    //MARK: IBaction
    
    @IBAction func mixerButtonPressed(_ sender: Any) {
    }
    
    

}

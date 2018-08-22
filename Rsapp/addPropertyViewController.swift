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
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this code will make the scrollview go up and down
        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: topView.frame.size.height)

        
    }


}

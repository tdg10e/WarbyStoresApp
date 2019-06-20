//
//  ViewController.swift
//  WarbyAssessment
//
//  Created by Mac User on 6/19/19.
//

import UIKit

class ViewController: UIViewController {
    var locations = [WarbyStore]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        StoreService.sharedInstance.getStores { (stores) in
            
        }
    }


}


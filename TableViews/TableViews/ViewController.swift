//
//  ViewController.swift
//  TableViews
//
//  Created by Marty Kausas on 2/3/15.
//  Copyright (c) 2015 Marty Kausas. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var TextView: UITextView!
    
    var firstString = String()
    override func viewDidLoad() {
//        super.viewDidLoad()
        
        TextView.text = firstString
    }
}
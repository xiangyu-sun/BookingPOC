//
//  ReturnFlightPageViewController.swift
//  EmiratesBooking
//
//  Created by rafal.manka on 22/07/2018.
//  Copyright © 2018 Emirates Airlines. All rights reserved.
//

import UIKit

class ReturnFlightPageViewController : UIViewController {
    
    @IBOutlet weak var fromFieldLayout: UIView!
    @IBOutlet weak var toFieldLayout: UIView!
    @IBOutlet weak var forFieldLayout: UIView!
    
    override func viewDidLoad() {
        fromFieldLayout.setBorder(radius: 5.0)
        toFieldLayout.setBorder(radius: 5.0)
        forFieldLayout.setBorder(radius: 5.0)
    }
    
}

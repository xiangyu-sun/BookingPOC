//
//  ViewController.swift
//  EmiratesBooking
//
//  Created by rafal.manka on 22/07/2018.
//  Copyright © 2018 Emirates Airlines. All rights reserved.
//

import UIKit

class SelectRouteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search flights"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.font: UIFont(name: "HelveticaNeue", size: 20)!
        ]
    }

}


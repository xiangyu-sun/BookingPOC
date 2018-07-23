//
//  UIViewExt.swift
//  EmiratesBooking
//
//  Created by rafal.manka on 22/07/2018.
//  Copyright © 2018 Emirates Airlines. All rights reserved.
//

import UIKit

extension UIView {
    
    public func setBorder(color: UIColor = UIColor.black, radius: CGFloat = 0.0, width: CGFloat = 1.0) {
        self.layer.borderWidth = width
        self.layer.cornerRadius = radius
        self.layer.shouldRasterize = false
        self.layer.rasterizationScale = 2
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        self.layer.borderColor = color.cgColor
    }
}

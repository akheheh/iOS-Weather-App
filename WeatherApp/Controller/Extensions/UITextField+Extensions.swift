//
//  UITextField+Extensions.swift
//  PodApp
//
//  Created by alex heidarian on 8/26/18.
//  Copyright © 2018 alex heidarian. All rights reserved.
//Extension for adding underline to user input

import UIKit

extension UITextField {
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.white.cgColor

        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}


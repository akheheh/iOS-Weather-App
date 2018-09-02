//
//  UIView+Extension.swift
//  PodApp
//
//  Created by alex heidarian on 9/1/18.
//  Copyright © 2018 alex heidarian. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setGradientBackground(col1: UIColor, col2: UIColor) {
        let gradLayer = CAGradientLayer();
        gradLayer.frame = bounds;//dimmensions of gradient layer = bounds of container
        gradLayer.colors = [col1.cgColor, col2.cgColor];
        gradLayer.startPoint = CGPoint(x: 1.0, y: 1.0);
        gradLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradLayer, at: 0)
    }
}

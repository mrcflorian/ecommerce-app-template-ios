//
//  UIView.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 2/28/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import CoreGraphics
import UIKit

extension UIView {
    func applyGradient(colors: [UIColor], locations: [NSNumber]? = nil, startPoint: CGPoint? = nil, endPoint: CGPoint? = nil) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map { $0.cgColor }
        gradient.locations = locations
        if let startPoint = startPoint, let endPoint = endPoint {
            gradient.startPoint = startPoint
            gradient.endPoint = endPoint
        }
        self.layer.insertSublayer(gradient, at: 0)
    }
}

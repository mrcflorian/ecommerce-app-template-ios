//
//  EcommerceAppNavigationController.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/26/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit
import Material

class EcommerceAppNavigationController: NavigationController {
    open override func prepare() {
        super.prepare()
        guard let v = navigationBar as? NavigationBar else {
            return
        }

        v.depthPreset = .none
        v.dividerColor = Color.grey.lighten3
    }
}

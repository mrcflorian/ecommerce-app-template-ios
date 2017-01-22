//
//  TransitionedViewController.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/21/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit
import Material

class EcommerceCartViewController: UIViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.purple.base

        prepareToolbar()
    }
}

extension EcommerceCartViewController {
    fileprivate func prepareToolbar() {
        guard let tc = toolbarController else {
            return
        }

        tc.toolbar.title = "Transitioned"
        tc.toolbar.detail = "View Controller"
    }
}

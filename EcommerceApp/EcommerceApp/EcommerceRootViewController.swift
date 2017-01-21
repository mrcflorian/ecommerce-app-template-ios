//
//  EcommerceRootViewController.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/21/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit
import Material

class EcommerceRootViewController: UIViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.grey.lighten5

        prepareToolbar()
    }
}

extension EcommerceRootViewController {
    fileprivate func prepareToolbar() {
        guard let tc = toolbarController else {
            return
        }

        tc.toolbar.title = "Material"
        tc.toolbar.detail = "Build Beautiful Software"
    }
}

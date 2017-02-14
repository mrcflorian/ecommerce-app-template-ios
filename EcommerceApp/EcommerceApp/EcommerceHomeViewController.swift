//
//  EcommerceRootViewController.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/21/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import Material
import UIKit

class EcommerceHomeViewController: UIViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.grey.lighten5
        prepareToolbar()
    }
}

extension EcommerceHomeViewController {
    fileprivate func prepareToolbar() {
        guard let tc = toolbarController else {
            return
        }

        tc.toolbar.title = "Shop"
    }
}

//
//  EcommerceAppToolbarController.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/21/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit
import Material

class EcommerceAppToolbarController: ToolbarController {
    fileprivate var menuButton: IconButton!
    fileprivate var searchButton: IconButton!

    override func prepare() {
        super.prepare()
        prepareMenuButton()
        prepareMoreButton()
        prepareStatusBar()
        prepareToolbar()
    }
}

extension EcommerceAppToolbarController {
    fileprivate func prepareMenuButton() {
        menuButton = IconButton(image: Icon.cm.menu)
        menuButton.addTarget(self, action: #selector(handleMenuButton), for: .touchUpInside)
    }

    fileprivate func prepareMoreButton() {
        searchButton = IconButton(image: Icon.cm.search)
        searchButton.addTarget(self, action: #selector(handleSearchButton), for: .touchUpInside)
    }

    fileprivate func prepareStatusBar() {
        statusBarStyle = .lightContent

        // Access the statusBar.
        //        statusBar.backgroundColor = Color.green.base
    }

    fileprivate func prepareToolbar() {
        toolbar.leftViews = [menuButton]
        toolbar.rightViews = [searchButton]
    }
}

extension EcommerceAppToolbarController {
    @objc
    fileprivate func handleMenuButton() {
        navigationDrawerController?.toggleLeftView()
    }

    @objc
    fileprivate func handleSearchButton() {
        navigationDrawerController?.toggleRightView()
    }
}

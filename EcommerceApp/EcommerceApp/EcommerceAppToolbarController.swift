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
    fileprivate var switchControl: Switch!
    fileprivate var moreButton: IconButton!

    override func prepare() {
        super.prepare()
        prepareMenuButton()
        prepareSwitch()
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

    fileprivate func prepareSwitch() {
        switchControl = Switch(state: .off, style: .light, size: .small)
    }

    fileprivate func prepareMoreButton() {
        moreButton = IconButton(image: Icon.cm.moreVertical)
        moreButton.addTarget(self, action: #selector(handleMoreButton), for: .touchUpInside)
    }

    fileprivate func prepareStatusBar() {
        statusBarStyle = .lightContent

        // Access the statusBar.
        //        statusBar.backgroundColor = Color.green.base
    }

    fileprivate func prepareToolbar() {
        toolbar.leftViews = [menuButton]
        toolbar.rightViews = [switchControl, moreButton]
    }
}

extension EcommerceAppToolbarController {
    @objc
    fileprivate func handleMenuButton() {
        navigationDrawerController?.toggleLeftView()
    }

    @objc
    fileprivate func handleMoreButton() {
        navigationDrawerController?.toggleRightView()
    }
}

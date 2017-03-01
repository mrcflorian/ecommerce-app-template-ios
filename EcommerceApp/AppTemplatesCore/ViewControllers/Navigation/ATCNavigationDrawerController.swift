//
//  ATCNavigationDrawerController.swift
//  AppTemplatesFoundation
//
//  Created by Florian Marcu on 2/10/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import Material
import UIKit

open class ATCNavigationDrawerController: NavigationDrawerController {

    open override func prepare() {
        super.prepare()

        delegate = self
        Application.statusBarStyle = .default
    }

    open func atcNavigationController() -> ATCNavigationController? {
        return rootViewController as? ATCNavigationController
    }
}

extension ATCNavigationDrawerController: NavigationDrawerControllerDelegate {
    public func navigationDrawerController(navigationDrawerController: NavigationDrawerController, willOpen position: NavigationDrawerPosition) {
    }

    public func navigationDrawerController(navigationDrawerController: NavigationDrawerController, didOpen position: NavigationDrawerPosition) {
    }

    public func navigationDrawerController(navigationDrawerController: NavigationDrawerController, willClose position: NavigationDrawerPosition) {
    }

    public func navigationDrawerController(navigationDrawerController: NavigationDrawerController, didClose position: NavigationDrawerPosition) {
    }

    public func navigationDrawerController(navigationDrawerController: NavigationDrawerController, didBeginPanAt point: CGPoint, position: NavigationDrawerPosition) {
    }

    public func navigationDrawerController(navigationDrawerController: NavigationDrawerController, didChangePanAt point: CGPoint, position: NavigationDrawerPosition) {
    }

    public func navigationDrawerController(navigationDrawerController: NavigationDrawerController, didEndPanAt point: CGPoint, position: NavigationDrawerPosition) {
    }

    public func navigationDrawerController(navigationDrawerController: NavigationDrawerController, didTapAt point: CGPoint, position: NavigationDrawerPosition) {
    }

    public func navigationDrawerController(navigationDrawerController: NavigationDrawerController, statusBar isHidden: Bool) {
    }
}

//
//  AppDelegate.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/21/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit
import Material

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {
        let homeVC = StoryboardEntityProvider().ecommerceProductCollectionVC()

        let appToolbarController = EcommerceAppToolbarController(rootViewController: homeVC)
        let menuViewController = StoryboardEntityProvider().ecommerceMenuViewController()

        window = UIWindow(frame: Screen.bounds)
        window!.rootViewController = EcommerceAppNavigationDrawerController(rootViewController: appToolbarController, leftViewController: menuViewController, rightViewController: nil)
        window!.makeKeyAndVisible()

        homeVC.products = Product.mockProducts()
        homeVC.screenTitle = "Shop"
    }
}


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
        let appToolbarController = EcommerceAppToolbarController(rootViewController: EcommerceRootViewController())
        let leftViewController = LeftViewController()

        window = UIWindow(frame: Screen.bounds)
        window!.rootViewController = EcommerceAppNavigationDrawerController(rootViewController: appToolbarController, leftViewController: leftViewController, rightViewController: nil)
        window!.makeKeyAndVisible()
    }
}


//
//  AppDelegate.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/21/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import Fabric
import FacebookCore
import FacebookLogin
import FacebookShare
import Firebase
import Stripe
import TwitterKit
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var cartManager = ShoppingCartManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.configureHostViewControllers()
        if (AppConfiguration.isLoginScreenEnabled) {
            if (AppConfiguration.isTwitterLoginEnabled) {
                Fabric.with([Twitter.self])
            }
            if (AppConfiguration.isFirebaseIntegrationEnabled) {
                FIRApp.configure()
            }
            if (AppConfiguration.isStripePaymentEnabled) {
                STPPaymentConfiguration.shared().publishableKey = AppConfiguration.stripePublishableKey
            }
            if (AppConfiguration.isApplePaymentEnabled) {
                STPPaymentConfiguration.shared().appleMerchantIdentifier = AppConfiguration.applePayMerchantIdentifier
            }
            if (AppConfiguration.isFacebookLoginEnabled) {
                return SDKApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
            }
        }
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if (AppConfiguration.isLoginScreenEnabled && AppConfiguration.isFacebookLoginEnabled) {
            return SDKApplicationDelegate.shared.application(app, open: url, options: options)
        }
        return true
    }

    fileprivate func configureHostViewControllers() {

        // Home view controller - the shopping screen
        let homeVC = StoryboardEntityProvider().ecommerceProductCollectionVC()
        homeVC.products = Product.mockProducts()
        homeVC.title = "Shop"

        // Checkout/Cart View Controller - the checkout screen, containing the products in the card

        NotificationCenter.default.addObserver(self, selector: #selector(didSendAddToCartNotification), name: kNotificationDidAddProductToCart, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didClearCartNotification), name: kNotificationDidAClearCart, object: nil)

        let cartVC = StoryboardEntityProvider().ecommerceCartVC()
        cartVC.cartManager = cartManager
        cartVC.title = "Shopping Cart"

        // Settings view controller - user settings screen
        let action = { (_ viewController: UIViewController?) -> (Void) in
            print("Settings button pressed from viewController")
            /**
             * Use this completion block to handle the actions taken by users on each settings item
             * You can even present other view controllers using the line above:

             * viewController?.navigationController?.pushViewController(newViewController, animated: true)
             */
        }
        let settingsItem1 = ATCSettingsItem(title: "Profile", style: .more, action: action)
        let settingsItem2 = ATCSettingsItem(title: "Payment Info", style: .text, action: action)
        let settingsItem3 = ATCSettingsItem(title: "Email Notifications", style: .toggle, action: action, toggleValue: false)
        let settingsItem4 = ATCSettingsItem(title: "Push Notifications", style: .toggle, action: action, toggleValue: true)
        let settingsItem5 = ATCSettingsItem(title: "Privacy Policy", style: .more, action: action)
        let settingsItem6 = ATCSettingsItem(title: "Terms & Conditions", style: .more, action: action)
        let settingsItems = [settingsItem1, settingsItem2, settingsItem3, settingsItem4, settingsItem5, settingsItem6]
        let settingsVC = ATCSettingsTableViewController(settings: settingsItems, nibNameOrNil: nil, nibBundleOrNil: nil)
        settingsVC.title = "Settings"

        // Navigation Item - Configuration for sidebar menu / TabBar

        let homeMenuItem = ATCNavigationItem(title: "Home", viewController: homeVC, image: UIImage(named: "shop-menu-icon"))
        let cardMenuItem = ATCNavigationItem(title: "Shopping Cart", viewController: cartVC, image: UIImage(named: "shopping-cart-menu-item"))
        let settingsMenuItem = ATCNavigationItem(title: "Settings", viewController: settingsVC, image: UIImage(named: "settings-menu-item"))
        let logoutMenuItem = ATCNavigationItem(title: "Logout", viewController: UIViewController(), image: UIImage(named: "logout-menu-item"))

        let menuItems = [homeMenuItem, cardMenuItem, settingsMenuItem, logoutMenuItem]


        // Configure the current user data
        let avatarURL = "https://scontent.xx.fbcdn.net/v/t1.0-1/p50x50/12801222_1293104680705553_7502147733893902564_n.jpg?oh=b151770a598fea1b2d6b8f3382d9e7c9&oe=593E48A9"
        let user = ATCUser(firstName: "Florian", lastName: "Marcu", avatarURL: avatarURL)

        let hostViewController = ATCHostViewController(style: .sideBar, items: menuItems, user: user)

        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = hostViewController
        window!.makeKeyAndVisible()
    }

    // Shopping Cart Mananger

    func addProduct(product: Product) {
        cartManager.addProduct(product: product)
        self.updateCartButton()
    }

    fileprivate func updateCartButton() {
    }

    @objc
    fileprivate func didSendAddToCartNotification(notification: Notification) {
        guard let product = notification.userInfo?["product"] as? Product else {
            return
        }
        self.addProduct(product: product)
    }

    @objc
    fileprivate func didClearCartNotification(notification: Notification) {
        self.updateCartButton()
    }

//    fileprivate func prepareCartButton() {
//        cartButton = IconButton(image: UIImage(named: "shopping-cart-menu-item"))
//        cartButton.tintColor = Color.blue
//        cartButton.backgroundColor = Color.green.base
//        cartButton.addTarget(self, action: #selector(handleCartButton), for: .touchUpInside)
//        cartButton.titleColor = .white
//        cartButton.layer.cornerRadius = 5
//    }

}


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
    fileprivate var cartButton: IconButton!

    var cartManager = ShoppingCartManager()

    override func prepare() {
        super.prepare()
        prepareMenuButton()
        prepareCartButton()
        prepareStatusBar()
        prepareToolbar()

        NotificationCenter.default.addObserver(self, selector: #selector(didSendAddToCartNotification), name: kNotificationDidAddProductToCart, object: nil)
    }

    func addProduct(product: Product) {
        cartManager.addProduct(product: product)
        cartButton.title = " \(cartManager.productCount())"
    }

    @objc
    fileprivate func didSendAddToCartNotification(notification: Notification) {
        guard let product = notification.userInfo?["product"] as? Product else {
            return
        }
        self.addProduct(product: product)
    }
}

extension EcommerceAppToolbarController {
    fileprivate func prepareMenuButton() {
        menuButton = IconButton(image: Icon.cm.menu)
        menuButton.addTarget(self, action: #selector(handleMenuButton), for: .touchUpInside)
    }

    fileprivate func prepareCartButton() {
        cartButton = IconButton(image: UIImage(named: "shopping-cart-menu-item"))
        cartButton.tintColor = Color.blue
        cartButton.backgroundColor = Color.green.base
        cartButton.addTarget(self, action: #selector(handleCartButton), for: .touchUpInside)
        cartButton.titleColor = .white
        cartButton.layer.cornerRadius = 5
    }

    fileprivate func prepareStatusBar() {
        statusBarStyle = .lightContent

        // Access the statusBar.
        //        statusBar.backgroundColor = Color.green.base
    }

    fileprivate func prepareToolbar() {
        toolbar.leftViews = [menuButton]
        toolbar.rightViews = [cartButton]
    }
}

extension EcommerceAppToolbarController {
    @objc
    fileprivate func handleMenuButton() {
        navigationDrawerController?.toggleLeftView()
    }

    @objc
    fileprivate func handleCartButton() {
        let cartVC = StoryboardEntityProvider().ecommerceCartVC()
        self.transition(to: cartVC, completion: nil)
        cartVC.cartManager = cartManager
        navigationDrawerController?.toggleRightView()
    }
}

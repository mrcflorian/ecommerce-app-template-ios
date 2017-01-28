//
//  ShoppingCartManager.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/24/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import Foundation

let kNotificationDidAddProductToCart = NSNotification.Name(rawValue: "kNotificationDidAddProductToCart")
let kNotificationDidAClearCart = NSNotification.Name(rawValue: "kNotificationDidAClearCart")

class ShoppingCartManager {

    var cart = ShoppingCart()

    func addProduct(product: Product, quantity: Int = 1) {
        if let item = cart.itemDictionary[product.id] {
            item.quantity += quantity
            return
        }
        cart.itemDictionary[product.id] = ShoppingCartItem(product: product, quantity: quantity)
    }

    func productCount() -> Int {
        return cart.itemDictionary.reduce(0) { (x, entry: (key: String, value: ShoppingCartItem)) -> Int in
            return x + entry.value.quantity
        }
    }

    func distinctProducts() -> [Product] {
        return cart.itemDictionary.values.map({$0.product})
    }

    func distinctProductCount() -> Int {
        return self.distinctProducts().count
    }

    func distinctProductItems() -> [ShoppingCartItem] {
        return cart.itemDictionary.values.map({$0})
    }

    func totalPrice() -> Double {
        return cart.itemDictionary.reduce(0.0) { (x, entry: (key: String, value: ShoppingCartItem)) -> Double in
            if let price = entry.value.product.productPrice {
                return x + Double(entry.value.quantity) * price
            }
            return x
        }
    }

    func clearProducts() {
        cart.itemDictionary = [:]
        NotificationCenter.default.post(name: kNotificationDidAClearCart, object: nil)
    }
}

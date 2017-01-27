//
//  ShoppingCartManager.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/24/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import Foundation

let kNotificationDidAddProductToCart = NSNotification.Name(rawValue: "kNotificationDidAddProductToCart")

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
        //return cart.itemDictionary.count

        return cart.itemDictionary.reduce(0) { (x, entry: (key: String, value: ShoppingCartItem)) -> Int in
            return x + entry.value.quantity
        }
    }
}

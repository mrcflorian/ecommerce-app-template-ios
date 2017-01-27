//
//  ShoppingCartItem.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/26/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

class ShoppingCartItem {
    var product: Product
    var quantity: Int
    init (product: Product, quantity: Int) {
        self.product = product
        self.quantity = quantity
    }
}

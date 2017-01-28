//
//  CartPlaceOrderTableViewCell.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/28/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import Material
import UIKit

class CartPlaceOrderTableViewCell: UITableViewCell {

    @IBOutlet var placeOrderButton: RaisedButton!

    var cartManager: ShoppingCartManager?

    func configureCell(cartManager: ShoppingCartManager) {
        self.cartManager = cartManager
        self.isUserInteractionEnabled = true
        placeOrderButton.addTarget(self, action: #selector(handlePlaceOrderButton), for: .touchUpInside)
        placeOrderButton.backgroundColor = UIColor(colorLiteralRed: 28/255, green: 87/255, blue: 255/255, alpha: 1)
    }

    @objc
    fileprivate func handlePlaceOrderButton() {
        // This is where you need to handle the placing of an order, based on the shopping cart configuration, accessible from cartMananger local var
    }
}

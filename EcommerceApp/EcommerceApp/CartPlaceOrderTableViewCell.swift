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

    weak var delegate: CartTableViewController?

    @IBOutlet var placeOrderButton: RaisedButton!

    func configureCell(cartManager: ShoppingCartManager) {
        self.isUserInteractionEnabled = true
        placeOrderButton.addTarget(self, action: #selector(handlePlaceOrderButton), for: .touchUpInside)
        placeOrderButton.backgroundColor = UIColor(colorLiteralRed: 28/255, green: 87/255, blue: 255/255, alpha: 1)
    }

    @objc
    fileprivate func handlePlaceOrderButton() {
        delegate?.didPlaceOrder()
    }
}

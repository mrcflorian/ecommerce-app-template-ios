//
//  CartTableViewCell.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/26/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productPriceLabel: UILabel!
    @IBOutlet var productNameLabel: UILabel!

    func configureCell(item: ShoppingCartItem?) {
        guard let item = item else {
            return
        }
        if let url = item.product.productImageURL, let productImageView = productImageView {
            productImageView.kf.setImage(with: URL(string: url))
        }
        if let price = item.product.productPrice {
            productPriceLabel.text = String(format:"$%.2f", price * Double(item.quantity))
        }
        if let productName = item.product.productName {
            let name = (item.quantity > 1) ? productName + " x \(item.quantity)" : productName
            productNameLabel.text = name
        }
    }
}

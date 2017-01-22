//
//  ProductCollectionViewCell.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/21/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import Kingfisher
import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet var productPriceLabel: UILabel!
    @IBOutlet var productTitleLabel: UILabel!
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productCategoryLabel: UILabel!

    func configureCell(product: Product) {
        if let url = product.productImageURL, let productImageView = productImageView {
            productImageView.kf.setImage(with: URL(string: url))
        }
        if let price = product.productPrice {
            productPriceLabel.text = String(format:"$%.0f", price)
        }
        productTitleLabel.text = product.productName
        productCategoryLabel.text = product.productCategory
    }
}

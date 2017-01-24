//
//  ImageCollectionViewCell.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/22/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet var productImageView: UIImageView!

    func configureCell(imageUrl: String?) {
        if let url = imageUrl, let productImageView = productImageView {
            productImageView.kf.setImage(with: URL(string: url))
        }
    }
}

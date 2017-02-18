//
//  CategoriesTableViewCell.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 2/18/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import Kingfisher
import UIKit

class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet var categoryImageView: UIImageView!
    @IBOutlet var categoryNameLabel: UILabel!

    func configure(category: Category) {
        if let urlString = category.imageURL {
            let imageURL = URL(string: urlString)
            categoryImageView.kf.setImage(with: imageURL)
        }
        categoryNameLabel.text = category.name
    }
}

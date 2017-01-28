//
//  CartTotalTableViewCell.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/28/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

class CartTotalTableViewCell: UITableViewCell {

    @IBOutlet var totalPriceLabel: UILabel!

    func configureCell(total: Double) {
        totalPriceLabel.text = String(format:"$%.2f", total)
    }
}

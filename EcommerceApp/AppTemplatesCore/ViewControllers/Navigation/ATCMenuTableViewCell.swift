//
//  ATCMenuTableViewCell.swift
//  AppTemplatesFoundation
//
//  Created by Florian Marcu on 2/10/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

open class ATCMenuTableViewCell: UITableViewCell {

    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var label: UILabel!

    fileprivate let bgView = UIView()

    public func configure(item: ATCNavigationItem) {
        itemImageView.image = item.image
        label.text = item.title
        bgView.backgroundColor = UIColor(colorLiteralRed: 49/255, green: 54/255, blue: 58/255, alpha: 1)
        selectedBackgroundView = bgView
        selectionStyle = .default
    }
}

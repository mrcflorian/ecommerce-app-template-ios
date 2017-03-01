//
//  ATCSettingsMoreTableViewCell.swift
//  AppTemplatesFoundation
//
//  Created by Florian Marcu on 2/11/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

open class ATCSettingsMoreTableViewCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    func configure(item: ATCSettingsItem) {
        label.text = item.title
    }
}

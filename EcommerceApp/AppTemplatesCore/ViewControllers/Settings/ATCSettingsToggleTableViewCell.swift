//
//  ATCSettingsToggleTableViewCell.swift
//  AppTemplatesFoundation
//
//  Created by Florian Marcu on 2/11/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

open class ATCSettingsToggleTableViewCell: UITableViewCell {

    fileprivate var item: ATCSettingsItem?

    @IBOutlet var label: UILabel!
    @IBOutlet var toggleSwitch: UISwitch!

    open func configure(item: ATCSettingsItem) {
        self.item = item
        if let toggleValue = item.toggleValue {
            toggleSwitch.setOn(toggleValue, animated: false)
        }
        label.text = item.title
    }
    @IBAction func didToggleSwitch(_ sender: UISwitch) {
        item?.action(nil)
    }
}

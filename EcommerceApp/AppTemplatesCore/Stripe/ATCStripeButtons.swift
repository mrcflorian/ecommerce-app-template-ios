//
//  ATCStripeButtons.swift
//  AppTemplatesFoundation
//
//  Created by Florian Marcu on 2/11/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

import UIKit
import Stripe

class ATCStripeHighlightingButton: UIButton {
    var highlightColor = UIColor(white: 0, alpha: 0.05)

    convenience init(highlightColor: UIColor) {
        self.init()
        self.highlightColor = highlightColor
    }

    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.backgroundColor = self.highlightColor
            } else {
                self.backgroundColor = UIColor.clear
            }
        }
    }
}

class ATCStripeBuyButton: ATCStripeHighlightingButton {
    var disabledColor = UIColor.lightGray
    var enabledColor = UIColor(red:0.22, green:0.65, blue:0.91, alpha:1.00)

    override var isEnabled: Bool {
        didSet {
            let color = isEnabled ? enabledColor : disabledColor
            self.setTitleColor(color, for: UIControlState())
            self.layer.borderColor = color.cgColor
            self.highlightColor = color.withAlphaComponent(0.5)
        }
    }

    convenience init(enabled: Bool, theme: STPTheme) {
        self.init()
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
        self.setTitle("Buy", for: UIControlState())
        self.disabledColor = theme.secondaryForegroundColor
        self.enabledColor = theme.accentColor
        self.isEnabled = enabled
    }
}

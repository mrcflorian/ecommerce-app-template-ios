//
//  LeftViewController.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/21/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit
import Material

struct ButtonLayout {
    struct Avatar {
        static let width: CGFloat = 70
        static let height: CGFloat = 70
        static let top: CGFloat = 50
    }
}

class MenuButton: FlatButton {

}

class EcommerceMenuViewController: UIViewController {

    @IBOutlet var userNameLabel: UILabel!

    @IBOutlet var avatarButton: IconButton!

    @IBOutlet var shopMenuButton: MenuButton!
    @IBOutlet var cartMenuButton: MenuButton!
    @IBOutlet var settingsMenuButton: MenuButton!
    @IBOutlet var logoutMenuButton: MenuButton!

    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(colorLiteralRed: 39/255, green: 44/255, blue: 48/255, alpha: 1)
        prepareAvatarButton()
        prepareMenuButton(shopMenuButton)
        prepareMenuButton(cartMenuButton)
        prepareMenuButton(settingsMenuButton)
        prepareMenuButton(logoutMenuButton)

        shopMenuButton.addTarget(self, action: #selector(handleShopButton), for: .touchUpInside)
        cartMenuButton.addTarget(self, action: #selector(handleCartButton), for: .touchUpInside)
    }
}

extension EcommerceMenuViewController {
    fileprivate func prepareAvatarButton() {
        let image = UIImage(named: "shopping-avatar", in: nil, compatibleWith: nil)?.withRenderingMode(.alwaysOriginal)
        avatarButton.image = image
        avatarButton.layer.cornerRadius = 0.5 * ButtonLayout.Avatar.width
        avatarButton.clipsToBounds = true
    }

    fileprivate func prepareMenuButton(_ button: MenuButton) {
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsetsMake(11, 11, 11, 11)
        button.titleEdgeInsets = UIEdgeInsetsMake(10, 20, 5, 0)
        button.layer.addBorder(edge: .bottom, color: Color.grey.darken1, thickness: 0.51)
    }
}

extension EcommerceMenuViewController {
    @objc
    fileprivate func handleShopButton() {
        let shopVC = StoryboardEntityProvider().ecommerceProductCollectionVC()
        shopVC.screenTitle = "Shop"
        toolbarController()?.transition(to: shopVC, completion: closeNavigationDrawer)
    }

    @objc
    fileprivate func handleCartButton() {
        let cartVC = StoryboardEntityProvider().ecommerceCartVC()
        let cartManager = toolbarController()?.cartManager
        toolbarController()?.transition(to: cartVC, completion: closeNavigationDrawer)
        cartVC.cartManager = cartManager
    }

    fileprivate func closeNavigationDrawer(result: Bool) {
        navigationDrawerController?.closeLeftView()
    }

    fileprivate func toolbarController() -> EcommerceAppToolbarController? {
        return (navigationDrawerController?.rootViewController as? EcommerceAppToolbarController)
    }
}

// This is extension is used to set the bottom border of the menu items
extension CALayer {

    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        let border = CALayer()
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.height, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: UIScreen.main.bounds.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
            break
        default:
            break
        }
        border.backgroundColor = color.cgColor;
        self.addSublayer(border)
    }
}

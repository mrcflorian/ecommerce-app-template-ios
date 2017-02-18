//
//  StoryboardEntityProvider.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/21/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

class StoryboardEntityProvider {

    let ecommerceStoryboard = UIStoryboard(name: "Ecommerce", bundle: nil)

    func ecommerceProductCollectionVC() -> EcommerceProductCollectionViewController {
        let vc = ecommerceStoryboard.instantiateViewController(withIdentifier: "EcommerceProductCollectionViewController") as! EcommerceProductCollectionViewController
        vc.products = Product.mockProducts()
        return vc
    }

    func ecommerceProductDetailsVC() -> EcommerceProductDetailsViewController {
        return ecommerceStoryboard.instantiateViewController(withIdentifier: "EcommerceProductDetailsViewController") as! EcommerceProductDetailsViewController
    }

    func ecommerceCartVC() -> EcommerceCartTableViewController {
        return ecommerceStoryboard.instantiateViewController(withIdentifier: "EcommerceCartTableViewController") as! EcommerceCartTableViewController
    }

    func settingsVC() -> UITableViewController {
        return ecommerceStoryboard.instantiateViewController(withIdentifier: "SettingsTableViewController") as! UITableViewController
    }

    func categoriesVC() -> CategoriesTableViewController {
        return ecommerceStoryboard.instantiateViewController(withIdentifier: "CategoriesTableViewController") as! CategoriesTableViewController
    }
}

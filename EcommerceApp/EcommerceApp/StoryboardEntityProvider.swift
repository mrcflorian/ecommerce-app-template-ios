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

    func ecommerceProductCollectionVC() -> ProductCollectionViewController {
        let vc = ecommerceStoryboard.instantiateViewController(withIdentifier: "ProductCollectionViewController") as! ProductCollectionViewController
        vc.products = Product.mockProducts()
        return vc
    }

    func ecommerceProductDetailsVC() -> ProductDetailsViewController {
        return ecommerceStoryboard.instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
    }

    func ecommerceCartVC() -> CartTableViewController {
        return ecommerceStoryboard.instantiateViewController(withIdentifier: "CartTableViewController") as! CartTableViewController
    }

    func settingsVC() -> UITableViewController {
        return ecommerceStoryboard.instantiateViewController(withIdentifier: "SettingsTableViewController") as! UITableViewController
    }

    func categoriesVC() -> CategoriesTableViewController {
        return ecommerceStoryboard.instantiateViewController(withIdentifier: "CategoriesTableViewController") as! CategoriesTableViewController
    }
}

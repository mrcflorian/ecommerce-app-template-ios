//
//  CategoriesTableViewController.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 2/18/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController {

    fileprivate let reuseIdentifier = "CategoriesTableViewCell"

    var categories: [Category]? {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CategoriesTableViewCell

        if let categories = categories {
            cell.configure(category: categories[indexPath.row])
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.width / 2
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let category = categories?[indexPath.row] {
            let productsVC = StoryboardEntityProvider().ecommerceProductCollectionVC()
            productsVC.products = Product.mockProducts().filter({category.name?.lowercased() == $0.productCategory?.lowercased()})
            productsVC.title = category.name
            self.navigationController?.pushViewController(productsVC, animated: true)
        }
    }
}

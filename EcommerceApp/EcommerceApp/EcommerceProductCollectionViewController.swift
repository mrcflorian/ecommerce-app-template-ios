//
//  EcommerceProductCollectionViewController.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/21/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import Material
import UIKit

private let reuseIdentifier = "ProductCollectionViewCell"

class EcommerceProductCollectionViewController: UICollectionViewController {
    var products: [Product] = [] {
        didSet {
            self.collectionView?.reloadData()
        }
    }
    var screenTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let tc = toolbarController else {
            return
        }
        tc.toolbar.title = screenTitle
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let offsetY: CGFloat = UIDeviceOrientationIsLandscape(UIDevice.current.orientation) ? 35 : 70
        self.collectionView?.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y, width: self.view.bounds.width, height: UIScreen.main.bounds.height - offsetY)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductCollectionViewCell
        cell.configureCell(product: products[indexPath.row])
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsVC = StoryboardEntityProvider().ecommerceProductDetailsVC()
        detailsVC.product = products[indexPath.row]

        (navigationDrawerController?.rootViewController as? ToolbarController)?.transition(to: detailsVC, completion: nil)
    }
}

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

class EcommerceProductCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var products: [Product] = [] {
        didSet {
            self.collectionView?.reloadData()
        }
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
        let navigationController = EcommerceAppNavigationController(rootViewController: detailsVC)
       self.present(navigationController, animated: true, completion: nil)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumCellSpacing()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let spacing = minimumCellSpacing()
        return UIEdgeInsetsMake(5, spacing, 5, spacing)
    }

    fileprivate func minimumCellSpacing() -> CGFloat {// The cell's size is 142 x 216
        let width = self.collectionView!.frame.size.width - 5
        let cellsPerRow = CGFloat(Int(width / 142.0))
        return (width - cellsPerRow * 142) / (cellsPerRow + 1)
    }
}

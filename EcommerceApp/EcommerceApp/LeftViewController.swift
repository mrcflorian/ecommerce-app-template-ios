//
//  LeftViewController.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/21/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit
import Material

class LeftViewController: UIViewController {
    fileprivate var transitionButton: FlatButton!

    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.blue.base

        prepareTransitionButton()
    }
}

extension LeftViewController {
    fileprivate func prepareTransitionButton() {
        transitionButton = FlatButton(title: "Transition VC", titleColor: .white)
        transitionButton.pulseColor = .white
        transitionButton.addTarget(self, action: #selector(handleTransitionButton), for: .touchUpInside)

        view.layout(transitionButton).horizontally().center()
    }
}

extension LeftViewController {
    @objc
    fileprivate func handleTransitionButton() {
        // Transition the entire NavigationDrawer rootViewController.
        //        navigationDrawerController?.transition(to: TransitionedViewController(), completion: closeNavigationDrawer)

        // Transition the ToolbarController rootViewController that is in the NavigationDrawer rootViewController.
        (navigationDrawerController?.rootViewController as? ToolbarController)?.transition(to: TransitionedViewController(), completion: closeNavigationDrawer)
    }

    fileprivate func closeNavigationDrawer(result: Bool) {
        navigationDrawerController?.closeLeftView()
    }
}

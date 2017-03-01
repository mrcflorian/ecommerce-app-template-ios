//
//  ViewControllerFactory.swift
//  AppTemplatesFoundation
//
//  Created by Florian Marcu on 2/6/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

public final class ATCViewControllerFactory {
    static func createLoginViewController(firebaseEnabled: Bool, loggedInViewController: ATCHostViewController) -> ATCLoginViewController {
        return ATCLoginViewController(nibName: "ATCLoginViewController", bundle: nil, firebaseEnabled: firebaseEnabled, loggedInViewController: loggedInViewController)
    }
}

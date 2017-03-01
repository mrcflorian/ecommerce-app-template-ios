//
//  ATCTableViewController.swift
//  AppTemplatesCore
//
//  Created by Florian Marcu on 2/2/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import AlamofireRSSParser
import UIKit

public enum ATCViewControllerAPIResponseType {
    case json
    case rss
    case none
}

open class ATCTableViewController<T: ATCBaseModel>: UITableViewController {

    var apiManager: ATCAPIManager!
    var streamObjects = [T]()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        config()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        config()
    }

    fileprivate func config() {
        apiManager = ATCAPIManager(urlPath: self.urlEndpointPath())
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        switch self.apiResponseType() {
        case .json:
            // TODO: Consolidate this call with the one below
            apiManager.retrieveListFromJSON(parameters: self.extraParameters(), completion: { (objects: [T]?, status: ATCNetworkResponseStatus) in
                if let objects = objects {
                    self.didReceiveStreamObjects(objects: objects)
                } else {
                    // TODO: Error case
                }
            })
        case .rss:
            apiManager.retrieveRSSFeed(parameters: self.extraParameters(), completion: { (rssFeed: RSSFeed?, status: ATCNetworkResponseStatus) in
                if let objects = rssFeed?.wordpressObjects().flatMap({ $0 as? T }) {
                    self.didReceiveStreamObjects(objects: objects)
                } else {
                    // TODO: Error case
                }
            })
        case .none:
            break
        }
    }

    // MARK: - To be overriden by subclasses

    func urlEndpointPath() -> String {
        return ""
    }

    func extraParameters() -> [String: String] {
        return [:]
    }

    func apiResponseType() -> ATCViewControllerAPIResponseType {
        return .json
    }

    // MARK: - Table view data source

    override open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return streamObjects.count
    }

    // MARK: - Private

    fileprivate func didReceiveStreamObjects(objects: [T]) {
        streamObjects += objects
        self.tableView.reloadData()
    }
}

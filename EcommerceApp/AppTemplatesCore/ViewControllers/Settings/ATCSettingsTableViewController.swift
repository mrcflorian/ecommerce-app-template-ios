//
//  ATCSettingsTableViewController.swift
//  AppTemplatesFoundation
//
//  Created by Florian Marcu on 2/11/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

open class ATCSettingsTableViewController: UITableViewController {
    fileprivate let settings: [ATCSettingsItem]

    init(settings: [ATCSettingsItem], nibNameOrNil: String?, nibBundleOrNil: Bundle?) {
        self.settings = settings
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        var headerNib = UINib(nibName: "ATCSettingsToggleTableViewCell", bundle:nil)
        tableView.register(headerNib, forCellReuseIdentifier: "ATCSettingsToggleTableViewCell")

        headerNib = UINib(nibName: "ATCSettingsTextTableViewCell", bundle:nil)
        tableView.register(headerNib, forCellReuseIdentifier: "ATCSettingsTextTableViewCell")

        headerNib = UINib(nibName: "ATCSettingsMoreTableViewCell", bundle:nil)
        tableView.register(headerNib, forCellReuseIdentifier: "ATCSettingsMoreTableViewCell")
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .white
    }

    // MARK: - Table view data source

    override open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }

    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = settings[indexPath.row]

        switch item.style {
        case .more:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ATCSettingsMoreTableViewCell", for: indexPath) as? ATCSettingsMoreTableViewCell
            cell?.configure(item: item)
            return cell!
        case .text:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ATCSettingsTextTableViewCell", for: indexPath) as? ATCSettingsTextTableViewCell
            cell?.configure(item: item)
            return cell!
        case .toggle:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ATCSettingsToggleTableViewCell", for: indexPath) as? ATCSettingsToggleTableViewCell
            cell?.configure(item: item)
            return cell!
        }
    }

    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = settings[indexPath.row]
        switch item.style {
        case .more, .text:
            item.action(self)
        case .toggle: break
        }
    }
}

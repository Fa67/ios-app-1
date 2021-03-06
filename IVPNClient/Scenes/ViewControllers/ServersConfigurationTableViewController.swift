//
//  ServersConfigurationTableViewController.swift
//  IVPNClient
//
//  Created by Juraj Hilje on 19/02/2019.
//  Copyright © 2019 IVPN. All rights reserved.
//

import UIKit

class ServersConfigurationTableViewController: UITableViewController {
    
    // MARK: - Properties -
    
    var collection = Application.shared.serverList.servers
    
    // MARK: - View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Configure"
    }
    
}

// MARK: - UITableViewDataSource -

extension ServersConfigurationTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 0 }
        return collection.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServerConfigurationCell", for: indexPath) as! ServerConfigurationCell
        let server = collection[indexPath.row]
        cell.viewModel = VPNServerViewModel(server: server)
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 { return "Fastest Server Settings" }
        return ""
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 { return "Disable servers you do not want to be chosen as the fastest server" }
        return ""
    }
    
}

// MARK: - UITableViewDelegate -

extension ServersConfigurationTableViewController {
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.textColor = UIColor.init(named: Theme.Key.ivpnLabel6)
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        if let footer = view as? UITableViewHeaderFooterView {
            footer.textLabel?.textColor = UIColor.init(named: Theme.Key.ivpnLabel6)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
}

// MARK: - ServerConfigurationCellDelegate -

extension ServersConfigurationTableViewController: ServerConfigurationCellDelegate {
    
    func toggle(isOn: Bool, gateway: String) {
        let fastestServerConfiguredKey = Application.shared.settings.fastestServerConfiguredKey
        
        if UserDefaults.standard.bool(forKey: fastestServerConfiguredKey) {
            StorageManager.saveServer(gateway: gateway, group: fastestServerConfiguredKey, isFastestEnabled: isOn)
        } else {
            Application.shared.serverList.saveAllServers(exceptionGateway: gateway)
            UserDefaults.standard.set(true, forKey: fastestServerConfiguredKey)
        }
        
        UserDefaults.standard.synchronize()
    }
    
    func showValidation(error: String) {
        showAlert(title: "", message: error)
    }
    
}

//
//  StoreTableViewController.swift
//  Koupgon
//
//  Created by Mobile on 2017-01-17.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit
import FirebaseDatabase

class StoreTableViewController: UITableViewController {

    // MARK: - Properties
    
    var stores: [Store] = []
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // load all stores
        let ref = FIRDatabase.database().reference().child("stores")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? Dictionary<String, AnyObject>
            // mapping
        }) { (error) in
            print(error.localizedDescription)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stores.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedStoreId = stores[indexPath.row].id
        let key: UserDefaultKey = .defaultStoreId
        UserDefaults.standard.set(selectedStoreId, forKey: key.rawValue)
        
        let targetVC = BrowseTableViewController(storeId: selectedStoreId)
        navigationController?.pushViewController(targetVC, animated: true)
    }
}

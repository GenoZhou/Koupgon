//
//  StoreTableViewController.swift
//  Koupgon
//
//  Created by Mobile on 2017-01-17.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit
import Firebase

class StoreTableViewController: UITableViewController {

    // MARK: - Properties
    
    var stores: [Store] = []
    var storeImages: [UIImage] = []
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup mock data
        let store1 = Store(id: "1", name: "Longo's", distance: "3.82", imageURL: "images/longos.jpg")
        let store2 = Store(id: "2", name: "FreshCo", distance: "4.03", imageURL: "images/freshco.jpg")
        let store3 = Store(id: "3", name: "Giant Tiger", distance: "12.36", imageURL: "images/gianttiger.jpg")
        let store4 = Store(id: "4", name: "Chalo! FreshCo", distance: "20.68", imageURL: "images/ChaloFreshCo.jpg")
        let store5 = Store(id: "5", name: "Zehrs Markets", distance: "27.78", imageURL: "images/ZehrsMarkets.jpg")
        let store6 = Store(id: "6", name: "Valufoods", distance: "917.35", imageURL: "images/valufoods.jpg")
        stores = [store1, store2, store3, store4, store5, store6]
        
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 16, right: 0)
        
        let queue = DispatchQueue(label: "imageDownloadingQueue")
        queue.async {
            for (index, element) in self.stores.enumerated() {
                self.storeImages.append(UIImage())
                let ref = FIRStorage.storage().reference(withPath: element.imageURL)
                ref.data(withMaxSize: 1*1024*1024) {
                    data, error in
                    if error == nil {
                        self.storeImages[index] = UIImage(data: data!)!
                        DispatchQueue.main.async {
                            let indexPath = IndexPath(row: index, section: 0)
                            self.tableView.reloadRows(at: [indexPath], with: .fade)
                        }
                    } else { print(error.debugDescription) }
                }
            }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreTableViewCell", for: indexPath) as! StoreTableViewCell
        let selectedStore = stores[indexPath.row]
        cell.title.text = "   \(selectedStore.name)"
        cell.distance.text = "\(selectedStore.distance) km away"
        cell.photo.image = storeImages[indexPath.row]
        return cell
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

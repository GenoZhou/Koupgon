//
//  BrowseTableViewController.swift
//  Koupgon
//
//  Created by Mobile on 2017-01-17.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit
import Firebase

class BrowseTableViewController: UITableViewController, AlertInjectable, UINavigationBarDelegate {
    
    // MARK: - Properties
    
    var storeName: String?
    var coupons: [Coupon] = []
    var couponImages: [UIImage] = []

    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        navigationController?.isToolbarHidden = false
        
        // Reload sotreName
        let key: UserDefaultKey = .defaultStoreName
        storeName = UserDefaults.standard.string(forKey: key.rawValue)
        
        // Config toolbar
        let storeItem = UIBarButtonItem(title: storeName, style: .plain, target: self, action: #selector(didTapSelectStoreBarButtonItem))
        setToolbarItems([storeItem], animated: false)
        
        // Config navigationItem
        navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup mock data
        let coupon = Coupon(title: "$0.50 Off", description: "Dr.Oetker Premium Desserts", expiry: 13, imageURL: "images/couponImage.jpeg", detail: "Printed coupgons are not accepted. Cannot be combined with any other coupon offer. No cash surrender value, no cash back. One coupgon must be presented for each product purchased. Not all items are available in all stores. Can only be redeemed using the coupgon mobile app.", websiteURL: "https://www.google.ca")
        coupons = Array(repeating: coupon, count: 20)
        
        // Set extra tableview inset
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 16, right: 0)
        
        // Async load images
        let queue = DispatchQueue(label: "couponImageLoadingQueue")
        queue.async {
            for (index, element) in self.coupons.enumerated() {
                self.couponImages.append(UIImage())
                let ref = FIRStorage.storage().reference(withPath: element.imageURL)
                ref.data(withMaxSize: 1*1024*1024) {
                    data, error in
                    if error == nil {
                        self.couponImages[index] = UIImage(data: data!)!
                        DispatchQueue.main.async {
                            let indexPath = IndexPath(row: index, section: 0)
                            self.tableView.reloadRows(at: [indexPath], with: .fade)
                        }
                    } else { dPrint(error.debugDescription) }
                }
            }
        }
    }
    
    // MARK: - Private Methods
    
    @objc private func didTapCissorButton(_ sender: UIButton) {
        dPrint(sender.tag)
        showAlert(withTitle: "Ummmm", message: "This feature not yet implemented.")
    }
    
    @objc private func didTapSelectStoreBarButtonItem() {
        let targetVC = StoryboardScene.Main.instantiateStore()
        navigationController?.pushViewController(targetVC, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coupons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BrowseTableViewCell", for: indexPath) as! BrowseTableViewCell
        let selectedCoupon = coupons[indexPath.row]
        cell.titleLabel.text = selectedCoupon.title
        cell.descriptionLabel.text = selectedCoupon.description
        cell.expiryLabel.text = "Clippable for \(selectedCoupon.expiry) days"
        cell.photo.image = couponImages[indexPath.row]
        cell.cissorButton.tag = indexPath.row
        cell.cissorButton.addTarget(self, action: #selector(didTapCissorButton(_:)), for: .touchUpInside)
        return cell
    }

    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let targetVC = StoryboardScene.Main.instantiateDetail()
        targetVC.coupon = coupons[indexPath.row]
        targetVC.couponImage = couponImages[indexPath.row]
        navigationController?.pushViewController(targetVC, animated: true)
    }
}

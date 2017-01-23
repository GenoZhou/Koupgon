//
//  DetailTableViewController.swift
//  Koupgon
//
//  Created by GenoZhou on 2017-01-20.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class DetailTableViewController: UITableViewController, AlertInjectable, ToastInjectable {
    
    // MARK: - Properties
    
    var coupon: Coupon?
    var couponImage: UIImage?

    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Config NavigationItem
        let backButton = UIBarButtonItem(image: #imageLiteral(resourceName: "arrowLeft"), style: .plain, target: self, action: #selector(didTapBackButton))
        navigationItem.setLeftBarButton(backButton, animated: false)
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        navigationItem.setRightBarButton(logoutButton, animated: false)

        // Set extra tableview inset
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 16, right: 0)
    }
    
    // MARK: - Private Methods
    
    @objc private func didTapCissorButton(_ sender: UIButton) {
        showAlert(withTitle: "Ummmm", message: "This feature is not yet implemented")
    }
    
    @objc private func didTapWebsiteButton() {
        let targetVC = StoryboardScene.Main.instantiateWeb()
        targetVC.urlContext = coupon?.websiteURL
        navigationController?.pushViewController(targetVC, animated: true)
    }
    
    @objc private func logout() {
        do {
            // Logout Firebase & facebook
            try FIRAuth.auth()?.signOut()
            let facebookLoginManager = FBSDKLoginManager()
            facebookLoginManager.logOut()
            UserDefaults.standard.removeObject(forKey: UserDefaultKey.defaultStoreName.rawValue)
            
            // jump back to welcome
            let rootVC = StoryboardScene.Main.instantiateWelcome()
            rootVC.delegate = navigationController as! WelcomeViewControllerDelegate?
            navigationController?.setViewControllers([rootVC], animated: false)
            _ = navigationController?.popToRootViewController(animated: true)
        } catch {
            dPrint("Signout failed")
            showToast(withText: "Failed to logout, try it later...", type: .warning)
        }
    }
    
    @objc private func didTapBackButton() {
        _ = navigationController?.popViewController(animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let coupon = self.coupon else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        cell.titleLabel.text = coupon.title
        cell.descriptionLabel.text = coupon.description
        cell.expiryLabel.text = "Clippable for \(coupon.expiry) days"
        cell.photo.image = couponImage
        cell.detailLabel.text = coupon.detail
        cell.cissorButton.addTarget(self, action: #selector(didTapCissorButton(_:)), for: .touchUpInside)
        cell.websiteButton.addTarget(self, action: #selector(didTapWebsiteButton), for: .touchUpInside)
        return cell
    }
}

//
//  MainNavigationController.swift
//  Koupgon
//
//  Created by Mobile on 2017-01-17.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit
import Firebase

class MainNavigationController: UINavigationController, WelcomeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Config default navigation bar
        navigationBar.barTintColor = .white

        // Jump to Browse if logged in
        ((FIRAuth.auth()?.currentUser) != nil) ? welcomeBack() : welcome()
    }
    
    // MARK: - Private Methods
    
    private func welcome() {
        let targetVC = StoryboardScene.Main.instantiateWelcome()
        targetVC.delegate = self
        setViewControllers([targetVC], animated: false)
    }
    
    private func welcomeBack() {
        let key: UserDefaultKey = .defaultStoreId
        if let storeId = UserDefaults.standard.string(forKey: key.rawValue) {
            let targetVC = BrowseTableViewController(storeId: storeId)
            setViewControllers([targetVC], animated: true)
        } else {
            let targetVC = StoryboardScene.Main.instantiateStore()
            setViewControllers([targetVC], animated: true)
        }
    }
    
    // MARK: - WelcomeViewControllerDelegate
    
    func didFinishAuthentication() {
        welcomeBack()
    }

}

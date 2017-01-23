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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Config default navigation bar
        navigationBar.barTintColor = .white
        let titleFont = UIFont(name: "Avenir Next", size: 17)
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black, NSFontAttributeName: titleFont!]
        
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
        let key: UserDefaultKey = .defaultStoreName
        if UserDefaults.standard.string(forKey: key.rawValue) != nil {
            let targetVC = StoryboardScene.Main.instantiateBrowse()
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

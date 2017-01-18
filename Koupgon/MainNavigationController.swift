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

        // Jump to Browse if logged in
        ((FIRAuth.auth()?.currentUser) != nil) ? jumpToBrowse() : jumpToWelcome()
    }
    
    // MARK: - Private Methods
    
    private func jumpToWelcome() {
        let welcomeVC = StoryboardScene.Main.instantiateWelcome()
        welcomeVC.delegate = self
        setViewControllers([welcomeVC], animated: false)
    }
    
    private func jumpToBrowse() {
        let browseVC = StoryboardScene.Main.instantiateBrowse()
        setViewControllers([browseVC], animated: true)
    }
    
    // MARK: - WelcomeViewControllerDelegate
    
    func willDismiss() {
        jumpToBrowse()
    }

}

//
//  WelcomeViewController.swift
//  Koupgon
//
//  Created by Mobile on 2017-01-17.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit

protocol WelcomeViewControllerDelegate: class {
    func willDismiss()
}

class WelcomeViewController: UIViewController, AuthViewControllerType {
    
    // MARK: - Internal Properties
    
    weak var delegate: WelcomeViewControllerDelegate?
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    
    @IBAction func emailSignupButtonTapped(_ sender: Any) {
        let signupVC = StoryboardScene.Main.instantiateSignup()
        present(signupVC, animated: true, completion: nil)
    }
    
    @IBAction func facebookSignupButtonTapped(_ sender: Any) {
        facebookSignup {
            self.delegate?.willDismiss()
        }
    }
    
    @IBAction func signinButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        delegate?.willDismiss()
    }
}


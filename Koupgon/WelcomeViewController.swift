//
//  WelcomeViewController.swift
//  Koupgon
//
//  Created by Mobile on 2017-01-17.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit

protocol WelcomeViewControllerDelegate: class {
    func didFinishAuthentication()
}

class WelcomeViewController: UIViewController, AuthInjectable, ToastInjectable, AuthNavigationControllerDelegate {
    
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
        let authNav = AuthNavigationController(rootViewController: signupVC)
        signupVC.delegate = authNav
        authNav.authNavDelegate = self
        present(authNav, animated: true, completion: nil)
    }
    
    @IBAction func facebookSignupButtonTapped(_ sender: Any) {
        facebookSignup {
            completed in
            completed ? self.delegate?.didFinishAuthentication() : self.showToast(withText: "Failed to sign up, try it later.", type: .warning)
        }
    }
    
    @IBAction func signinButtonTapped(_ sender: Any) {
        let signinVC = StoryboardScene.Main.instantiateSignin()
        let authNav = AuthNavigationController(rootViewController: signinVC)
        signinVC.delegate = authNav
        authNav.authNavDelegate = self
        present(authNav, animated: true, completion: nil)
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        delegate?.didFinishAuthentication()
    }
    
    // MARK: - AuthNavigationControllerDelegate
    
    func willFinishAuthentication(_ completion: () -> ()) {
        delegate?.didFinishAuthentication()
        completion()
    }
}


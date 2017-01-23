//
//  AuthNavigationController.swift
//  Koupgon
//
//  Created by Mobile on 2017-01-18.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit

protocol AuthNavigationControllerDelegate: class {
    func willFinishAuthentication(_ completion: () -> ())
}

class AuthNavigationController: UINavigationController, SigninViewControllerDelegate, SignupViewControllerDelegate {

    // MARK: - Properties
    
    weak var authNavDelegate: AuthNavigationControllerDelegate?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = .white
        let titleFont = UIFont(name: "Avenir Next", size: 17)
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: titleFont!]
    }
    
    // MARK: - SigninViewControllerDelegate
    
    func didFinishSignin() {
        self.authNavDelegate?.willFinishAuthentication {
            dismiss(animated: true, completion: nil)
        }
    }
    
    func willGoSignup() {
        let targetVC = StoryboardScene.Main.instantiateSignup()
        targetVC.delegate = self
        pushViewController(targetVC, animated: true)
    }
    
    // MARK: - SignupViewControllerDelegate
    
    func didFinishSignup() {
        self.authNavDelegate?.willFinishAuthentication {
            dismiss(animated: true, completion: nil)
        }
    }
    
}

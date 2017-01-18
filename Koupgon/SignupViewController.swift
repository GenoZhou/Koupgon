//
//  SignupViewController.swift
//  Koupgon
//
//  Created by GenoZhou on 2017-01-18.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, AuthViewControllerType {

    override func viewDidLoad() {
        super.viewDidLoad()
        let dismissButton = UIBarButtonItem(image: #imageLiteral(resourceName: "cross"), style: .plain, target: self, action: #selector(cancelSignup))
        navigationItem.setRightBarButtonItems([dismissButton], animated: false)
    }

    // MARK: - Private Methods
    
    @objc private func cancelSignup() {
        dismiss(animated: true, completion: nil)
    }

}

//
//  SignupViewController.swift
//  Koupgon
//
//  Created by GenoZhou on 2017-01-18.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit

protocol SignupViewControllerDelegate: class {
    func didFinishSignup()
}

class SignupViewController: UIViewController, AuthInjectable, ToastInjectable, UITextFieldDelegate {

    // MARK: - IBOutlets
    
    @IBOutlet var inputCollection: [TextField]!
    @IBOutlet weak var emailField: TextField!
    @IBOutlet weak var passwordField: TextField!
    @IBOutlet weak var confirmPasswordField: TextField!
    @IBOutlet weak var checkbox: Checkbox!
    @IBOutlet weak var signupButton: Button!
    
    // MARK: - Properties
    weak var delegate: SignupViewControllerDelegate?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register textfield event
        inputCollection.forEach { $0.label.delegate = self }
        
        // Config navigationItem
        let dismissButton = UIBarButtonItem(image: #imageLiteral(resourceName: "cross"), style: .plain, target: self, action: #selector(cancelSignup))
        navigationItem.setRightBarButtonItems([dismissButton], animated: false)
        
        // Disable signup button
        signupButton.isEnabled = false
    }

    // MARK: - Private Methods
    
    @objc private func cancelSignup() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - IBActions

    @IBAction func signupButtonTapped(_ sender: Any) {
        signup(withEmail: emailField.label.text!, password: passwordField.label.text!) { 
            completed in
            completed ? self.delegate?.didFinishSignup() : self.showToast(withText: "Failed to sign up, try it later.", type: .warning)
        }
    }
    
    @IBAction func facebookSignupButtonTapped(_ sender: Any) {
        facebookSignup {
            completed in
            completed ? self.delegate?.didFinishSignup() : self.showToast(withText: "Failed to sign up, try it later.", type: .warning)
        }
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        signupButton.isEnabled = !emailField.label.text!.isEmpty && !passwordField.label.text!.isEmpty && !confirmPasswordField.label.text!.isEmpty && checkbox.isSelected
    }
    
}

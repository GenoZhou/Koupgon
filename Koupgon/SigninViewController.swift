//
//  SigninViewController.swift
//  Koupgon
//
//  Created by Mobile on 2017-01-18.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit

protocol SigninViewControllerDelegate: class {
    func didFinishSignin()
    func willGoSignup()
}

class SigninViewController: UIViewController, AuthInjectable, ToastInjectable, UITextFieldDelegate {

    // MARK: - IBOutlets
    @IBOutlet var inputCollection: [TextField]!
    @IBOutlet weak var emailField: TextField!
    @IBOutlet weak var passwordField: TextField!
    @IBOutlet weak var signinButton: Button!
    
    // MARK: - Properties
    weak var delegate: SigninViewControllerDelegate?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register textfield event
        inputCollection.forEach { $0.label.delegate = self }
        
        // Config navigationItem
        let dismissButton = UIBarButtonItem(image: #imageLiteral(resourceName: "cross"), style: .plain, target: self, action: #selector(cancelSignin))
        navigationItem.setRightBarButtonItems([dismissButton], animated: false)
        
        // Disable signin button
        signinButton.isEnabled = false
    }
    
    // MARK: - Private Methods
    
    @objc private func cancelSignin() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - IBActions

    @IBAction func signinButtonTapped(_ sender: Any) {
        signin(withEmail: emailField.label.text!, password: passwordField.label.text!) { 
            completed in
            completed ? self.delegate?.didFinishSignin() : self.showToast(withText: "Failed to sign in, try it later.", type: .warning)
        }
    }

    @IBAction func facebookSigninButtonTapped(_ sender: Any) {
        facebookSignup {
            completed in
            completed ? self.delegate?.didFinishSignin() : self.showToast(withText: "Failed to sign in, try it later.", type: .warning)
        }
    }
    
    @IBAction func resetPasswordButtonTapped(_ sender: Any) {
        guard !emailField.label.text!.isEmpty else { showToast(withText: "Email Required", type: .warning); return }
        resetPassword(with: emailField.label.text!) {
            completed in
            if completed {
                let alert = UIAlertController(title: "Success", message: "An email will be sent shortly with the intruction to reset your password.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            } else {
                self.showToast(withText: "Failed to reset, try it later.", type: .warning)
            }
        }
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        delegate?.willGoSignup()
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let fulfilled = !emailField.label.text!.isEmpty && !passwordField.label.text!.isEmpty
        signinButton.isEnabled = fulfilled
        signinButton.backdropColor = fulfilled ? #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) : UIColor.white
        signinButton.titleColor = fulfilled ? .white : .black
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

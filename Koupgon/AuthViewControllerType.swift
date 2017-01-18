//
//  AuthViewControllerType.swift
//  Koupgon
//
//  Created by GenoZhou on 2017-01-18.
//  Copyright © 2017 genozhou. All rights reserved.
//

import Foundation
import Firebase
import FBSDKLoginKit

protocol AuthViewControllerType {}

extension AuthViewControllerType where Self: UIViewController {
    
    func facebookSignup(_ completion: @escaping () -> ()) {
        let manager = FBSDKLoginManager()
        manager.logIn(withReadPermissions: ["public_profile"], from: self) { (result, error) in
            guard error == nil else { print("Process error"); return }
            guard result?.isCancelled == false else { print("Cancelled"); return }
            print("Signed in")
            let token: String = FBSDKAccessToken.current().tokenString
            let credential = FIRFacebookAuthProvider.credential(withAccessToken: token)
            FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
                guard error == nil else { print("Process error"); return }
                print("Signed up")
                completion()
            })
        }
    }
    
    func signup(with email: String, password: String, completion: @escaping () -> ()) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password) {
            (user, error) in
            guard error == nil else { print("Process error"); return }
            print("Signed up")
            completion()
        }
    }
    
    func signin(with email: String, password: String, completion: @escaping () -> ()) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password) {
            (user, error) in
            guard error == nil else { print("Process error"); return }
            print("Signed in")
            completion()
        }
    }
    
    func resetPassword(with email: String, completion: @escaping () -> ()) {
        FIRAuth.auth()?.sendPasswordReset(withEmail: email) {
            error in
            guard error == nil else { print("Process error"); return }
            print("Reset!")
            completion()
        }
    }
}

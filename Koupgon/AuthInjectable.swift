//
//  AuthInjectable.swift
//  Koupgon
//
//  Created by GenoZhou on 2017-01-18.
//  Copyright © 2017 genozhou. All rights reserved.
//

import Foundation
import Firebase
import FBSDKLoginKit

protocol AuthInjectable {}

extension AuthInjectable where Self: UIViewController {
    
    func facebookSignup(_ completion: @escaping (Bool) -> ()) {
        let manager = FBSDKLoginManager()
        manager.logIn(withReadPermissions: ["public_profile"], from: self) { (result, error) in
            guard error == nil else { print("Process error"); completion(false); return }
            guard result?.isCancelled == false else { print("Cancelled"); completion(false); return }
            print("Signed in")
            let token: String = FBSDKAccessToken.current().tokenString
            let credential = FIRFacebookAuthProvider.credential(withAccessToken: token)
            FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
                guard error == nil else { print("Process error"); completion(false); return }
                print("Signed up")
                completion(true)
            })
        }
    }
    
    func signup(withEmail email: String, password: String, completion: @escaping (Bool) -> ()) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password) {
            (user, error) in
            guard error == nil else { print("Process error"); completion(false); return }
            print("Signed up")
            completion(true)
        }
    }
    
    func signin(withEmail email: String, password: String, completion: @escaping (Bool) -> ()) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password) {
            (user, error) in
            guard error == nil else { print("Process error"); completion(false); return }
            print("Signed in")
            completion(true)
        }
    }
    
    func resetPassword(with email: String, completion: @escaping (Bool) -> ()) {
        FIRAuth.auth()?.sendPasswordReset(withEmail: email) {
            error in
            guard error == nil else { print("Process error"); completion(false); return }
            print("Reset!")
            completion(true)
        }
    }
}

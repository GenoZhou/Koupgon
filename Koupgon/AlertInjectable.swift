//
//  AlertInjectable.swift
//  Koupgon
//
//  Created by GenoZhou on 2017-01-20.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit

protocol AlertInjectable {}

extension AlertInjectable where Self: UIViewController {
    func showAlert(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

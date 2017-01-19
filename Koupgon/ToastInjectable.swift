//
//  ToastInjectable.swift
//  Koupgon
//
//  Created by GenoZhou on 2017-01-18.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit

enum ToastType {
    case normal, warning
}

protocol ToastInjectable {}

extension ToastInjectable where Self: UIViewController {
    
    func showToast(withText text: String, type: ToastType) {
        let toast = Toast()
        
        view.addSubview(toast)
        toast.translatesAutoresizingMaskIntoConstraints = false
        toast.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        toast.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        toast.titleLabel.text = text
        switch type {
        case .normal:
            toast.titleLabel.textColor = .white
            toast.backgroundColor = .darkGray
        case .warning:
            toast.titleLabel.textColor = .white
            toast.backgroundColor = .red
        }
        
        let time: TimeInterval = 2.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) { 
            toast.removeFromSuperview()
        }
    }
}

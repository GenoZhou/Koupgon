//
//  Toast.swift
//  Koupgon
//
//  Created by GenoZhou on 2017-01-18.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit

class Toast: UIView {
    
    let titleLabel = UILabel()
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 50)
    }

    convenience init() {
        self.init(frame: CGRect.zero)
        
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        titleLabel.font = titleLabel.font.withSize(16)
        titleLabel.layer.opacity = 0.8
        titleLabel.textAlignment = .center
    }
}

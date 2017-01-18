//
//  Button.swift
//  Koupgon
//
//  Created by Mobile on 2017-01-17.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit

@IBDesignable
class Button: IBDesignableControl {
    
    @IBOutlet weak var backdrop: UIView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    @IBInspectable var backdropColor: UIColor = .white {
        didSet {
            backdrop.backgroundColor = backdropColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            backdrop.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.lightGray {
        didSet {
            backdrop.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            backdrop.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var titleLabel: String? {
        get {
            return title.text
        }
        set(text) {
            title.text = text
        }
    }
    
    @IBInspectable var titleSize: CGFloat = 16.0 {
        didSet {
            title.font = title.font.withSize(titleSize)
        }
    }
    
    @IBInspectable var titleColor: UIColor = .darkText {
        didSet {
            title.textColor = titleColor
        }
    }
    
    @IBInspectable var iconImage: UIImage? {
        get {
            return icon.image
        }
        set(image) {
            icon.contentMode = .scaleAspectFit
            icon.image = image
        }
    }
    
    override func awakeFromNib() {
        self.subviews.forEach { $0.isUserInteractionEnabled = false }
    }
    
}

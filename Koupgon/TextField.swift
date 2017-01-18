//
//  TextField.swift
//  Koupgon
//
//  Created by GenoZhou on 2017-01-18.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit

enum TextFieldType: String {
    case normal, email, password
}

@IBDesignable
class TextField: IBDesignableView {

    @IBOutlet weak var label: UITextField!
    @IBOutlet weak var underline: UIView!
    
    @IBInspectable var labelColor: UIColor = .darkText {
        didSet {
            label.textColor = labelColor
            label.tintColor = labelColor
        }
    }
    
    @IBInspectable var labelPlaceholderText: String = ""
    
    @IBInspectable var labelPlaceholderColor: UIColor = .lightText
    
    @IBInspectable var underlineColor: UIColor = .darkGray {
        didSet {
            underline.backgroundColor = underlineColor
        }
    }
    
    @IBInspectable var labelType: String = "normal" {
        didSet {
            guard let type: TextFieldType = TextFieldType(rawValue: labelType) else { return }
            switch type {
            case .normal:
                label.keyboardType = .default
                label.isSecureTextEntry = false
            case .email:
                label.keyboardType = .emailAddress
                label.isSecureTextEntry = false
            case .password:
                label.keyboardType = .default
                label.isSecureTextEntry = true
            }
        }
    }
    
    override func awakeFromNib() {
        let attributes = [NSForegroundColorAttributeName: labelPlaceholderColor]
        label.attributedPlaceholder = NSAttributedString(string: labelPlaceholderText, attributes: attributes)
    }
    
    override func prepareForInterfaceBuilder() {
        let attributes = [NSForegroundColorAttributeName: labelPlaceholderColor]
        label.attributedPlaceholder = NSAttributedString(string: labelPlaceholderText, attributes: attributes)
    }
}

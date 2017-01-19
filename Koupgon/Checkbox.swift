//
//  Checkbox.swift
//  Koupgon
//
//  Created by Mobile on 2017-01-18.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit

@IBDesignable
class Checkbox: IBDesignableControl {

    @IBOutlet weak var backdrop: UIView!
    @IBOutlet weak var icon: UIImageView!
    
    
    @IBInspectable var borderColor: UIColor = .white {
        didSet {
            backdrop.layer.cornerRadius = 3.0
            backdrop.layer.borderWidth = 1.0
            backdrop.layer.borderColor = borderColor.cgColor
            backdrop.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var selectedImage: UIImage? {
        get {
            return icon.image
        }
        set(image) {
            icon.contentMode = .scaleToFill
            icon.image = image
            icon.isHidden = true
        }
    }
    
    override func awakeFromNib() {
        isSelected = false
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        isSelected = !isSelected
        print(isSelected)
        icon.isHidden = !isSelected
    }
}

//
//  StoreTableViewCell.swift
//  Koupgon
//
//  Created by GenoZhou on 2017-01-19.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit

@IBDesignable
class StoreTableViewCell: IBDesignableTableViewCell {
    
    @IBOutlet weak var shadow: UIView!
    @IBOutlet weak var backdrop: UIView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var distance: UILabel!
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            backdrop.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadow.layer.cornerRadius = cornerRadius
        shadow.layer.shadowColor = UIColor.lightGray.cgColor
        shadow.layer.shadowOpacity = 0.8
        shadow.layer.shadowOffset = CGSize(width: 0, height: 1)
        shadow.layer.shadowRadius = 1.0
        shadow.layer.shouldRasterize = true
    }

    override func prepareForInterfaceBuilder() {
        awakeFromNib()
    }
}

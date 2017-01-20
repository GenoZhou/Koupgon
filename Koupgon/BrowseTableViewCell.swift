//
//  BrowseTableViewCell.swift
//  Koupgon
//
//  Created by GenoZhou on 2017-01-19.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit

@IBDesignable
class BrowseTableViewCell: IBDesignableTableViewCell {

    @IBOutlet weak var backdrop: UIView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var expiryLabel: UILabel!
    @IBOutlet weak var cissorButton: UIButton!
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            backdrop.layer.cornerRadius = cornerRadius
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        photo.layer.borderColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1).cgColor
        photo.layer.borderWidth = 1.0
    }
    
    override func prepareForInterfaceBuilder() {
        photo.layer.borderColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1).cgColor
        photo.layer.borderWidth = 1.0
    }

}

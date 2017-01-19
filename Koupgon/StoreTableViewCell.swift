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
    
    @IBOutlet weak var backdrop: UIView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var distance: UILabel!
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            backdrop.layer.cornerRadius = cornerRadius
            backdrop.layer.masksToBounds = true
        }
    }

}

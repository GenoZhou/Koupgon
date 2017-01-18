//
//  IBDesignable.swift
//  IBDesignable
//
//  Created by GenoZhou on 2016-12-16.
//  Copyright © 2016 GenoZhou. All rights reserved.
//
import UIKit

public protocol IBDesignable: class {
    
    var nibContainerView: UIView { get }
    
    var nibName: String { get }
    
    func loadViewFromNib() -> UIView
}

extension IBDesignable where Self: UIView {
    
    public var nibContainerView: UIView {
        return self
    }
    
    public var nibName: String {
        return type(of: self).description().components(separatedBy: ".").last!
    }
    
    public func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    public func xibSetup() {
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        nibContainerView.addSubview(view)
    }
}

@IBDesignable
open class IBDesignableView: UIView, IBDesignable {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
}

@IBDesignable
open class IBDesignableTableViewCell: UITableViewCell, IBDesignable {
    
    public var nibContainerView: UIView {
        return self.contentView
    }
    
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
}


@IBDesignable
open class IBDesignableTableViewHeaderFooterView: UITableViewHeaderFooterView, IBDesignable {
    
    public var nibContainerView: UIView {
        return self.contentView
    }
    
    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
}

@IBDesignable
open class IBDesignableControl: UIControl, IBDesignable {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
}

@IBDesignable
open class IBDesignableCollectionReusableView: UICollectionReusableView, IBDesignable {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
}

@IBDesignable
open class IBDesignableCollectionViewCell: UICollectionViewCell, IBDesignable {
    
    public var nibContainerView: UIView {
        return self.contentView
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
}

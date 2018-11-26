//
//  NibLoadable.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

// Protocol for loading views from Nibs.
// Nib name should be the same as class name for this protocol to work.
protocol NibLoadable: class {}

extension NibLoadable where Self: UIView {
    static var nibName: String {
        return String(describing: Self.self)
    }

    static func fromNib(_ bundle: Bundle? = nil) -> Self {
        let nib = UINib(nibName: nibName, bundle: bundle)
        // TODO: Check for more than 1 view.
        guard let view = nib.instantiate(withOwner: nil, options: nil)[0] as? Self else {
            fatalError("Could not instantiate a view of type \(Self.self) from nib \(nibName)")
        }
        return view
    }
}

//
//  UIViewController+Storyboards.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

extension UIViewController {
    static func fromStoryboard<ViewController: UIViewController>() -> ViewController {
        let storyboardName = String(describing: ViewController.self)
        let bundle = Bundle(for: ViewController.self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        guard let controller = storyboard.instantiateInitialViewController() as? ViewController else {
            fatalError("Could not create a view controller of type '\(ViewController.self)' from storyboard")
        }
        return controller
    }
}

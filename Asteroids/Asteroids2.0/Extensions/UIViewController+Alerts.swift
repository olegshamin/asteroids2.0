//
//  UIViewController+Alerts.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

extension UIViewController {

    func displayOKAlert(withTitle title: String, message: String, okHandler: (() -> Void)? = nil) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
            okHandler?()
        }
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }

    func display(error: Error, okHandler: (() -> Void)? = nil) {
        let title = NSLocalizedString("Error", comment: "")
        let message = error.localizedDescription
        displayOKAlert(withTitle: title, message: message, okHandler: okHandler)
    }

    func display(errorViewModel: ErrorViewModel, okHandler: (() -> Void)? = nil) {
        let title = errorViewModel.title
        let message = errorViewModel.message
        displayOKAlert(withTitle: title, message: message, okHandler: okHandler)
    }
}

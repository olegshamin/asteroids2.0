//
//  Notification+KeyboardHeight.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

private extension CGFloat {
    static let defaultPortraitKeyboardHeight: CGFloat = 216
    static let defaultLandscapeKeyboardHeight: CGFloat = 162
}

extension Notification {

    var keyboardHeight: CGFloat {
        let height = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue?.height
        return height ?? defaultKeyboardHeight
    }

    private var defaultKeyboardHeight: CGFloat {
        let statusBarOrientation = UIApplication.shared.statusBarOrientation
        switch statusBarOrientation {
        case .portrait, .portraitUpsideDown:
            return .defaultPortraitKeyboardHeight
        case .landscapeLeft, .landscapeRight, .unknown:
            return .defaultLandscapeKeyboardHeight
        }
    }
}

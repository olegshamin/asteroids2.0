//
//  UIView+AutoLayout.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

// Autolayout extensions to UIView for common cases.
extension UIView {

    /// Aligns edges of view to layout mardin guide edges of provided view with edge insets.
    ///
    /// - Parameters:
    ///   - edges: Edge insets, applied as constraint constants.
    ///   - view: View to which edges are pinned to.
    func align(to edges: UIEdgeInsets, of view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
        let constraints = [
            leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: edges.left),
            trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: edges.right),
            topAnchor.constraint(equalTo: margins.topAnchor, constant: edges.top),
            bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: edges.bottom)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    /// Places current view to the same position as the specified view, regardless of layout margins
    ///
    /// - Parameter view: View
    func alignEqually(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerYAnchor.constraint(equalTo: view.centerYAnchor),
            widthAnchor.constraint(equalTo: view.widthAnchor),
            heightAnchor.constraint(equalTo: view.heightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    /// Constraints view's center to the center of provided view
    ///
    /// - Parameter view: View to which current view is aligned
    func alignCentered(in view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
        let constraints = [
            centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            centerYAnchor.constraint(equalTo: margins.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

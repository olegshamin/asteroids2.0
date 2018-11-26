//
//  AsyncDisplayLogic.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

/// Base display logic protocol for modules with async operations, e.g. network requests
protocol AsyncDisplayLogic: class {
    func displayLoading()
    func displayContent()
}

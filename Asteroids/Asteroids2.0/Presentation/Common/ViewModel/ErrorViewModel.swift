//
//  ErrorViewModel.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

struct ErrorViewModel {

    // MARK: Properties

    let title: String
    let message: String

    // MARK: Initialization

    init(title: String, message: String) {
        self.title = title
        self.message = message
    }

    init(error: Error) {
        self.title = NSLocalizedString("Error", comment: "")
        self.message = error.localizedDescription
    }
}

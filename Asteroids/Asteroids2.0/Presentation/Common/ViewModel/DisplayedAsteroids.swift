//
//  DisplayedAsteroids.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 03/12/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

struct DisplayedAsteroids {

    // MARK: Properties

    let title: String
    var asteroids: [AsteroidViewModel] = []

    // MARK: Initialization

    init(
        with title: String
        ) {
        self.title = title
    }
}

//
//  List.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

enum List {
    enum Asteroids {
        struct Request {}
        struct Response {
            var asteroids: [Asteroid]?
            let error: Error?
        }
        struct ViewModel {
            struct Success {
                let asteroidsViewModel: [AsteroidViewModel]
            }
            struct Failure {
                let errorViewModel: ErrorViewModel
            }
        }
    }
}

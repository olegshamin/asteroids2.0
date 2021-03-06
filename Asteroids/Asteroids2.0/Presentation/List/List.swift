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
            struct Success {
                var asteroids: [Asteroid]
            }
            struct Failure {
                let error: Error
            }
        }
        struct ViewModel {
            struct Success {
                var displayedAsteroids: [DisplayedAsteroids]
            }
            struct Failure {
                let errorViewModel: ErrorViewModel
            }
        }
    }
}

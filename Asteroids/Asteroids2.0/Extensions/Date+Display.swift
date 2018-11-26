//
//  Date+Display.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 25/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

extension Date {
    func convertToDisplayString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}

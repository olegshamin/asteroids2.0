//
//  Date+Add.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 03/12/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

extension Date {

    func adding(_ days: Int) -> Date {
        guard let newDate = Calendar.current.date(byAdding: .day, value: days, to: self) else {
            return Date()
        }
        return newDate
    }
}

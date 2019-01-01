//
//  AsteroidViewModel.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 28/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

struct AsteroidViewModel {

    // MARK: Properties

    var name: String = ""
    var diameter: String = ""
    var distance: String = ""
    var velocity: String = ""
    var isItDangerous: Bool = false
    private let formatter = NumberFormatter()

    // MARK: Initialization

    init(
        asteroid: Asteroid
        ) {

        setupFormatter()
        self.name = update(name: asteroid.name)
        self.diameter = getDiameter(from: asteroid)
        self.distance = getDistance(from: asteroid)
        self.velocity = getVelocity(from: asteroid)
        self.isItDangerous = asteroid.isItDangerous
    }

    // MARK: Private helpers

    private func setupFormatter() {
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.maximumFractionDigits = 0
    }

    private func getDiameter(from asteroid: Asteroid) -> String {
        let range = convertToStringRange(from: asteroid.diameterMMin, to: asteroid.diameterMMax)
        return "\(range) \(NSLocalizedString("m", comment: ""))"
    }

    private func getDistance(from asteroid: Asteroid) -> String {
        guard let distanceDouble = Double(asteroid.distanceKm) else {
            return "--- \(NSLocalizedString("km", comment: ""))"
        }
        let distance = formatter.string(from: NSNumber(value: distanceDouble))
        return "\(distance ?? "---") \(NSLocalizedString("km", comment: ""))"
    }

    private func getVelocity(from asteroid: Asteroid) -> String {
        guard let velocityDouble = Double(asteroid.velocityKmh) else {
            return "--- \(NSLocalizedString("kmh", comment: ""))"
        }
        let velocity = formatter.string(from: NSNumber(value: velocityDouble))
        return "\(velocity ?? "---") \(NSLocalizedString("kmh", comment: ""))"
    }

    private func convertToStringRange(from: Double, to: Double) -> String {
        let from = String(format: "%.0f", from)
        let to = String(format: "%.0f", to)
        return "\(from) - \(to)"
    }

    private func update(name: String) -> String {
        if name.first == "(" {
            let convertedName = name.replacingOccurrences(of: "(", with: "")
            return convertedName.replacingOccurrences(of: ")", with: "")
        } else {
            return name
        }
    }
}

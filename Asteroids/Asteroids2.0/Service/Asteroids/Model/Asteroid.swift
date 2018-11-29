//
//  Asteroid.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 18/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

struct Asteroid {

    // MARK: Properties

    let id: String
    let name: String
    let date: Date
    let diameterKmMin: Double
    let diameterKmMax: Double
    let diameterMMin: Double
    let diameterMMax: Double
    let diameterMiMin: Double
    let diameterMiMax: Double
    let diameterFMin: Double
    let diameterFMax: Double
    let isItDangerous: Bool
    let velocityKms: String
    let velocityKmh: String
    let velocityMph: String
    let distanceAstronomical: String
    let distanceLunar: String
    let distanceKm: String
    let distanceMi: String
    let orbitalData: OrbitalData

    // MARK: Initialization

    init(
        id: String,
        name: String,
        date: Date,
        diameterKmMin: Double,
        diameterKmMax: Double,
        diameterMMin: Double,
        diameterMMax: Double,
        diameterMiMin: Double,
        diameterMiMax: Double,
        diameterFMin: Double,
        diameterFMax: Double,
        isItDangerous: Bool,
        velocityKms: String,
        velocityKmh: String,
        velocityMph: String,
        distanceAstronomical: String,
        distanceLunar: String,
        distanceKm: String,
        distanceMi: String,
        orbitalData: OrbitalData
        ) {
        self.id = id
        self.name = name
        self.date = date
        self.diameterKmMin = diameterKmMin
        self.diameterKmMax = diameterKmMax
        self.diameterMMin = diameterMMin
        self.diameterMMax = diameterMMax
        self.diameterMiMin = diameterMiMin
        self.diameterMiMax = diameterMiMax
        self.diameterFMin = diameterFMin
        self.diameterFMax = diameterFMax
        self.isItDangerous = isItDangerous
        self.velocityKms = velocityKms
        self.velocityKmh = velocityKmh
        self.velocityMph = velocityMph
        self.distanceAstronomical = distanceAstronomical
        self.distanceLunar = distanceLunar
        self.distanceKm = distanceKm
        self.distanceMi = distanceMi
        self.orbitalData = orbitalData
    }
}

extension Asteroid: Equatable {
    static func == (lhs: Asteroid, rhs: Asteroid) -> Bool {
        return lhs.id == rhs.id
    }
}

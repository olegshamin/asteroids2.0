//
//  RealmAsteroid.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 27/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmAsteroid: Object {

    // MARK: Properties

    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var date: Date = Date()
    @objc dynamic var timeInterval: Double = -1
    @objc dynamic var diameterKmMin: Double = -1
    @objc dynamic var diameterKmMax: Double = -1
    @objc dynamic var diameterMMin: Double = -1
    @objc dynamic var diameterMMax: Double = -1
    @objc dynamic var diameterMiMin: Double = -1
    @objc dynamic var diameterMiMax: Double = -1
    @objc dynamic var diameterFMin: Double = -1
    @objc dynamic var diameterFMax: Double = -1
    @objc dynamic var isItDangerous: Bool = false
    @objc dynamic var velocityKms: String = ""
    @objc dynamic var velocityKmh: String = ""
    @objc dynamic var velocityMph: String = ""
    @objc dynamic var distanceAstronomical: String = ""
    @objc dynamic var distanceLunar: String = ""
    @objc dynamic var distanceKm: String = ""
    @objc dynamic var distanceMi: String = ""
    @objc dynamic var orbitalData: RealmOrbitalData?

    override static func primaryKey() -> String? {
        return #keyPath(RealmAsteroid.id)
    }

    // MARK: Initialization

    convenience init(
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
        orbitalData: RealmOrbitalData?
        ) {
        self.init()
        self.id = id
        self.name = name
        self.date = date
        self.timeInterval = date.timeIntervalSince1970
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

    // MARK: Equatable

    static func == (lhs: RealmAsteroid, rhs: RealmAsteroid) -> Bool {
        return lhs.id == rhs.id
    }
}

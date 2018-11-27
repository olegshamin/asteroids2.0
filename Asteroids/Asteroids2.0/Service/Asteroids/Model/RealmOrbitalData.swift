//
//  RealmOrbitalData.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 27/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmOrbitalData: Object {

    // MARK: Properties

    @objc dynamic var asteroidId: String = ""
    @objc dynamic var orbitId: String = ""
    @objc dynamic var orbitDaterminationDate: String = ""
    @objc dynamic var firstObservationDate: String = ""
    @objc dynamic var lastObservationDate: String = ""
    @objc dynamic var dataArcInDays: Int = -1
    @objc dynamic var observationUsed: Int = -1
    @objc dynamic var orbitUncertainty: String = ""
    @objc dynamic var minimumOrbitIntersection: String = ""
    @objc dynamic var jupiterTisserandInvariant: String = ""
    @objc dynamic var epochOsculation: String = ""
    @objc dynamic var eccentricity: String = ""
    @objc dynamic var semiMajorAxis: String = ""
    @objc dynamic var inclination: String = ""
    @objc dynamic var ascendingNodeLongitude: String = ""
    @objc dynamic var orbitalPeriod: String = ""
    @objc dynamic var perihelionDistance: String = ""
    @objc dynamic var perihelionArgument: String = ""
    @objc dynamic var aphelionDistance: String = ""
    @objc dynamic var perihelionTime: String = ""
    @objc dynamic var meanAnomaly: String = ""
    @objc dynamic var meanMotion: String = ""
    @objc dynamic var equinox: String = ""
    @objc dynamic var orbitalClass: RealmOrbitClass?

    override static func primaryKey() -> String? {
        return #keyPath(RealmOrbitalData.asteroidId)
    }

    // MARK: Initialization

    convenience init(
        asteroidId: String,
        orbitId: String,
        orbitDaterminationDate: String,
        firstObservationDate: String,
        lastObservationDate: String,
        dataArcInDays: Int,
        observationUsed: Int,
        orbitUncertainty: String,
        minimumOrbitIntersection: String,
        jupiterTisserandInvariant: String,
        epochOsculation: String,
        eccentricity: String,
        semiMajorAxis: String,
        inclination: String,
        ascendingNodeLongitude: String,
        orbitalPeriod: String,
        perihelionDistance: String,
        perihelionArgument: String,
        aphelionDistance: String,
        perihelionTime: String,
        meanAnomaly: String,
        meanMotion: String,
        equinox: String,
        orbitalClass: RealmOrbitClass?
        ) {
        self.init()
        self.asteroidId = asteroidId
        self.orbitId = orbitId
        self.orbitDaterminationDate = orbitDaterminationDate
        self.firstObservationDate = firstObservationDate
        self.lastObservationDate = lastObservationDate
        self.dataArcInDays = dataArcInDays
        self.observationUsed = observationUsed
        self.orbitUncertainty = orbitUncertainty
        self.minimumOrbitIntersection = minimumOrbitIntersection
        self.jupiterTisserandInvariant = jupiterTisserandInvariant
        self.epochOsculation = epochOsculation
        self.eccentricity = eccentricity
        self.semiMajorAxis = semiMajorAxis
        self.inclination = inclination
        self.ascendingNodeLongitude = ascendingNodeLongitude
        self.orbitalPeriod = orbitalPeriod
        self.perihelionDistance = perihelionDistance
        self.perihelionArgument = perihelionArgument
        self.aphelionDistance = aphelionDistance
        self.perihelionTime = perihelionTime
        self.meanAnomaly = meanAnomaly
        self.meanMotion = meanMotion
        self.equinox = equinox
        self.orbitalClass = orbitalClass
    }

    // MARK: Equatable

    static func == (lhs: RealmOrbitalData, rhs: RealmOrbitalData) -> Bool {
        return lhs.orbitId == rhs.orbitId &&
            lhs.orbitDaterminationDate == rhs.orbitDaterminationDate &&
            lhs.firstObservationDate == rhs.firstObservationDate &&
            lhs.lastObservationDate == rhs.lastObservationDate &&
            lhs.dataArcInDays == rhs.dataArcInDays &&
            lhs.observationUsed == rhs.observationUsed &&
            lhs.orbitUncertainty == rhs.orbitUncertainty &&
            lhs.minimumOrbitIntersection == rhs.minimumOrbitIntersection &&
            lhs.jupiterTisserandInvariant == rhs.jupiterTisserandInvariant &&
            lhs.epochOsculation == rhs.epochOsculation &&
            lhs.eccentricity == rhs.eccentricity &&
            lhs.semiMajorAxis == rhs.semiMajorAxis &&
            lhs.inclination == rhs.inclination &&
            lhs.ascendingNodeLongitude == rhs.ascendingNodeLongitude &&
            lhs.orbitalPeriod == rhs.orbitalPeriod &&
            lhs.perihelionDistance == rhs.perihelionDistance &&
            lhs.perihelionArgument == rhs.perihelionArgument &&
            lhs.aphelionDistance == rhs.aphelionDistance &&
            lhs.perihelionTime == rhs.perihelionTime &&
            lhs.meanAnomaly == rhs.meanAnomaly &&
            lhs.meanMotion == rhs.meanMotion &&
            lhs.equinox == rhs.equinox &&
            lhs.orbitalClass == rhs.orbitalClass
    }
}

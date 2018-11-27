//
//  OrbitalData.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 27/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

struct OrbitalData {

    // MARK: Properties

    let asteroidId: String
    let orbitId: String
    let orbitDaterminationDate: String
    let firstObservationDate: String
    let lastObservationDate: String
    let dataArcInDays: Int
    let observationUsed: Int
    let orbitUncertainty: String
    let minimumOrbitIntersection: String
    let jupiterTisserandInvariant: String
    let epochOsculation: String
    let eccentricity: String
    let semiMajorAxis: String
    let inclination: String
    let ascendingNodeLongitude: String
    let orbitalPeriod: String
    let perihelionDistance: String
    let perihelionArgument: String
    let aphelionDistance: String
    let perihelionTime: String
    let meanAnomaly: String
    let meanMotion: String
    let equinox: String
    let orbitalClass: OrbitClass

    // MARK: Initialization

    init(
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
        orbitalClass: OrbitClass
        ) {
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
}

extension OrbitalData: Equatable {
    static func == (lhs: OrbitalData, rhs: OrbitalData) -> Bool {
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

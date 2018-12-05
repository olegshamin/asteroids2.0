//
//  AsteroidDatabaseMapper.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 05/12/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

protocol AsteroidDatabaseMapper {
    func map(_ databaseModel: RealmAsteroid) throws -> Asteroid
    func map(_ uiModel: Asteroid) throws -> RealmAsteroid
}

final class AsteroidDatabaseMapperImpl: AsteroidDatabaseMapper, Mapper {

    typealias InputModel = Asteroid
    typealias OutputModel = RealmAsteroid

    // MARK: AsteroidDatabaseMapper

    func map(_ databaseModel: RealmAsteroid) throws -> Asteroid {

        let id = databaseModel.id
        let name = databaseModel.name
        let date = databaseModel.date
        let diameterKmMin = databaseModel.diameterKmMin
        let diameterKmMax = databaseModel.diameterKmMax
        let diameterMMin = databaseModel.diameterMMin
        let diameterMMax = databaseModel.diameterMMax
        let diameterMiMin = databaseModel.diameterMiMin
        let diameterMiMax = databaseModel.diameterMiMax
        let diameterFMin = databaseModel.diameterFMin
        let diameterFMax = databaseModel.diameterFMax
        let isItDangerous = databaseModel.isItDangerous
        let velocityKms = databaseModel.velocityKms
        let velocityKmh = databaseModel.velocityKmh
        let velocityMph = databaseModel.velocityMph
        let distanceAstronomical = databaseModel.distanceAstronomical
        let distanceLunar = databaseModel.distanceLunar
        let distanceKm = databaseModel.distanceKm
        let distanceMi = databaseModel.distanceMi

        let orbitalData = getOrbitalData(from: databaseModel)

        return Asteroid(id: id,
                        name: name,
                        date: date,
                        diameterKmMin: diameterKmMin,
                        diameterKmMax: diameterKmMax,
                        diameterMMin: diameterMMin,
                        diameterMMax: diameterMMax,
                        diameterMiMin: diameterMiMin,
                        diameterMiMax: diameterMiMax,
                        diameterFMin: diameterFMin,
                        diameterFMax: diameterFMax,
                        isItDangerous: isItDangerous,
                        velocityKms: velocityKms,
                        velocityKmh: velocityKmh,
                        velocityMph: velocityMph,
                        distanceAstronomical: distanceAstronomical,
                        distanceLunar: distanceLunar,
                        distanceKm: distanceKm,
                        distanceMi: distanceMi,
                        orbitalData: orbitalData)
    }

    func map(_ uiModel: Asteroid) throws -> RealmAsteroid {

        let id = uiModel.id
        let name = uiModel.name
        let date = uiModel.date
        let diameterKmMin = uiModel.diameterKmMin
        let diameterKmMax = uiModel.diameterKmMax
        let diameterMMin = uiModel.diameterMMin
        let diameterMMax = uiModel.diameterMMax
        let diameterMiMin = uiModel.diameterMiMin
        let diameterMiMax = uiModel.diameterMiMax
        let diameterFMin = uiModel.diameterFMin
        let diameterFMax = uiModel.diameterFMax
        let isItDangerous = uiModel.isItDangerous
        let velocityKms = uiModel.velocityKms
        let velocityKmh = uiModel.velocityKmh
        let velocityMph = uiModel.velocityMph
        let distanceAstronomical = uiModel.distanceAstronomical
        let distanceLunar = uiModel.distanceLunar
        let distanceKm = uiModel.distanceKm
        let distanceMi = uiModel.distanceMi

        let realmOrbitalData = getRealmOrbitalData(from: uiModel)

        return RealmAsteroid(id: id,
                             name: name,
                             date: date,
                             diameterKmMin: diameterKmMin,
                             diameterKmMax: diameterKmMax,
                             diameterMMin: diameterMMin,
                             diameterMMax: diameterMMax,
                             diameterMiMin: diameterMiMin,
                             diameterMiMax: diameterMiMax,
                             diameterFMin: diameterFMin,
                             diameterFMax: diameterFMax,
                             isItDangerous: isItDangerous,
                             velocityKms: velocityKms,
                             velocityKmh: velocityKmh,
                             velocityMph: velocityMph,
                             distanceAstronomical: distanceAstronomical,
                             distanceLunar: distanceLunar,
                             distanceKm: distanceKm,
                             distanceMi: distanceMi,
                             orbitalData: realmOrbitalData)
    }

    // MARK: Private helpers

    private func getOrbitalData(from databaseModel: RealmAsteroid) -> OrbitalData {

        let asteroidId = databaseModel.orbitalData?.asteroidId
        let orbitId = databaseModel.orbitalData?.orbitId
        let orbitDaterminationDate = databaseModel.orbitalData?.orbitDaterminationDate
        let firstObservationDate = databaseModel.orbitalData?.firstObservationDate
        let lastObservationDate = databaseModel.orbitalData?.lastObservationDate
        let dataArcInDays = databaseModel.orbitalData?.dataArcInDays
        let observationUsed = databaseModel.orbitalData?.observationUsed
        let orbitUncertainty = databaseModel.orbitalData?.orbitUncertainty
        let minimumOrbitIntersection = databaseModel.orbitalData?.minimumOrbitIntersection
        let jupiterTisserandInvariant = databaseModel.orbitalData?.jupiterTisserandInvariant
        let epochOsculation = databaseModel.orbitalData?.epochOsculation
        let eccentricity = databaseModel.orbitalData?.eccentricity
        let semiMajorAxis = databaseModel.orbitalData?.semiMajorAxis
        let inclination = databaseModel.orbitalData?.inclination
        let ascendingNodeLongitude = databaseModel.orbitalData?.ascendingNodeLongitude
        let orbitalPeriod = databaseModel.orbitalData?.orbitalPeriod
        let perihelionDistance = databaseModel.orbitalData?.perihelionDistance
        let perihelionArgument = databaseModel.orbitalData?.perihelionArgument
        let aphelionDistance = databaseModel.orbitalData?.aphelionDistance
        let perihelionTime = databaseModel.orbitalData?.perihelionTime
        let meanAnomaly = databaseModel.orbitalData?.meanAnomaly
        let meanMotion = databaseModel.orbitalData?.meanMotion
        let equinox = databaseModel.orbitalData?.equinox

        let type = databaseModel.orbitalData?.orbitalClass?.type
        let range = databaseModel.orbitalData?.orbitalClass?.range
        let descr = databaseModel.orbitalData?.orbitalClass?.descr

        let orbitClass = OrbitClass(type: type ?? "Null",
                                    range: range ?? "Null",
                                    descr: descr ?? "Null")

        let orbitalData = OrbitalData(asteroidId: asteroidId ?? "Null",
                                      orbitId: orbitId ?? "Null",
                                      orbitDaterminationDate: orbitDaterminationDate ?? "Null",
                                      firstObservationDate: firstObservationDate ?? "Null",
                                      lastObservationDate: lastObservationDate ?? "Null",
                                      dataArcInDays: dataArcInDays ?? 0,
                                      observationUsed: observationUsed ?? 0,
                                      orbitUncertainty: orbitUncertainty ?? "Null",
                                      minimumOrbitIntersection: minimumOrbitIntersection ?? "Null",
                                      jupiterTisserandInvariant: jupiterTisserandInvariant ?? "Null",
                                      epochOsculation: epochOsculation ?? "Null",
                                      eccentricity: eccentricity ?? "Null",
                                      semiMajorAxis: semiMajorAxis ?? "Null",
                                      inclination: inclination ?? "Null",
                                      ascendingNodeLongitude: ascendingNodeLongitude ?? "Null",
                                      orbitalPeriod: orbitalPeriod ?? "Null",
                                      perihelionDistance: perihelionDistance ?? "Null",
                                      perihelionArgument: perihelionArgument ?? "Null",
                                      aphelionDistance: aphelionDistance ?? "Null",
                                      perihelionTime: perihelionTime ?? "Null",
                                      meanAnomaly: meanAnomaly ?? "Null",
                                      meanMotion: meanMotion ?? "Null",
                                      equinox: equinox ?? "Null",
                                      orbitalClass: orbitClass)
        return orbitalData
    }

    private func getRealmOrbitalData(from uiModel: Asteroid) -> RealmOrbitalData {

        let asteroidId = uiModel.orbitalData.asteroidId
        let orbitId = uiModel.orbitalData.orbitId
        let orbitDaterminationDate = uiModel.orbitalData.orbitDaterminationDate
        let firstObservationDate = uiModel.orbitalData.firstObservationDate
        let lastObservationDate = uiModel.orbitalData.lastObservationDate
        let dataArcInDays = uiModel.orbitalData.dataArcInDays
        let observationUsed = uiModel.orbitalData.observationUsed
        let orbitUncertainty = uiModel.orbitalData.orbitUncertainty
        let minimumOrbitIntersection = uiModel.orbitalData.minimumOrbitIntersection
        let jupiterTisserandInvariant = uiModel.orbitalData.jupiterTisserandInvariant
        let epochOsculation = uiModel.orbitalData.epochOsculation
        let eccentricity = uiModel.orbitalData.eccentricity
        let semiMajorAxis = uiModel.orbitalData.semiMajorAxis
        let inclination = uiModel.orbitalData.inclination
        let ascendingNodeLongitude = uiModel.orbitalData.ascendingNodeLongitude
        let orbitalPeriod = uiModel.orbitalData.orbitalPeriod
        let perihelionDistance = uiModel.orbitalData.perihelionDistance
        let perihelionArgument = uiModel.orbitalData.perihelionArgument
        let aphelionDistance = uiModel.orbitalData.aphelionDistance
        let perihelionTime = uiModel.orbitalData.perihelionTime
        let meanAnomaly = uiModel.orbitalData.meanAnomaly
        let meanMotion = uiModel.orbitalData.meanMotion
        let equinox = uiModel.orbitalData.equinox

        let type = uiModel.orbitalData.orbitalClass.type
        let range = uiModel.orbitalData.orbitalClass.range
        let descr = uiModel.orbitalData.orbitalClass.descr

        let realmOrbitClass = RealmOrbitClass(type: type,
                                              range: range,
                                              descr: descr)

        let realmOrbitalData = RealmOrbitalData(asteroidId: asteroidId,
                                                orbitId: orbitId,
                                                orbitDaterminationDate: orbitDaterminationDate,
                                                firstObservationDate: firstObservationDate,
                                                lastObservationDate: lastObservationDate,
                                                dataArcInDays: dataArcInDays,
                                                observationUsed: observationUsed,
                                                orbitUncertainty: orbitUncertainty,
                                                minimumOrbitIntersection: minimumOrbitIntersection,
                                                jupiterTisserandInvariant: jupiterTisserandInvariant,
                                                epochOsculation: epochOsculation,
                                                eccentricity: eccentricity,
                                                semiMajorAxis: semiMajorAxis,
                                                inclination: inclination,
                                                ascendingNodeLongitude: ascendingNodeLongitude,
                                                orbitalPeriod: orbitalPeriod,
                                                perihelionDistance: perihelionDistance,
                                                perihelionArgument: perihelionArgument,
                                                aphelionDistance: aphelionDistance,
                                                perihelionTime: perihelionTime,
                                                meanAnomaly: meanAnomaly,
                                                meanMotion: meanMotion,
                                                equinox: equinox,
                                                orbitalClass: realmOrbitClass)
        return realmOrbitalData
    }
}

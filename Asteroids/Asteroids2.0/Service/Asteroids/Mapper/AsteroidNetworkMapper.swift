//
//  AsteroidNetworkMapper.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 29/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

protocol AsteroidNetworkMapper {
    func map(_ dictionary: ModelDictionary) throws -> Asteroid
    func map(_ asteroid: Asteroid) throws -> ModelDictionary
}

final class AsteroidNetworkMapperImpl: AsteroidNetworkMapper, Mapper {

    typealias InputModel = ModelDictionary
    typealias OutputModel = Asteroid

    // MARK: AsteroidNetworkMapper

    func map(_ asteroid: Asteroid) throws -> ModelDictionary {
        assertionFailure("Not implemented")
        return [:]
    }

    func map(_ dictionary: ModelDictionary) throws -> Asteroid {

        let id: String = try dictionary.mapField(withKey: ServerField.id)
        let name: String = try dictionary.mapField(withKey: ServerField.name)

        let estimatedDiameter: ModelDictionary = try dictionary.mapField(withKey: ServerField.estimated_diameter)
        let diameterInKm: ModelDictionary = try estimatedDiameter.mapField(withKey: ServerField.kilometers)
        let diameterKmMin: Double = try diameterInKm.mapField(withKey: ServerField.estimated_diameter_min)
        let diameterKmMax: Double = try diameterInKm.mapField(withKey: ServerField.estimated_diameter_max)
        let diameterInM: ModelDictionary = try estimatedDiameter.mapField(withKey: ServerField.meters)
        let diameterMMin: Double = try diameterInM.mapField(withKey: ServerField.estimated_diameter_min)
        let diameterMMax: Double = try diameterInM.mapField(withKey: ServerField.estimated_diameter_max)
        let diameterInMi: ModelDictionary = try estimatedDiameter.mapField(withKey: ServerField.miles)
        let diameterMiMin: Double = try diameterInMi.mapField(withKey: ServerField.estimated_diameter_min)
        let diameterMiMax: Double = try diameterInMi.mapField(withKey: ServerField.estimated_diameter_max)
        let diameterInF: ModelDictionary = try estimatedDiameter.mapField(withKey: ServerField.feet)
        let diameterFMin: Double = try diameterInF.mapField(withKey: ServerField.estimated_diameter_min)
        let diameterFMax: Double = try diameterInF.mapField(withKey: ServerField.estimated_diameter_max)

        let isItDangerous: Bool = try dictionary.mapField(withKey: ServerField.is_potentially_hazardous_asteroid)

        let closeApproachData: ModelDictionary = try dictionary.mapField(withKey: ServerField.close_approach_data)
        let date: String = try closeApproachData.mapField(withKey: ServerField.close_approach_date)

        let relativeVelocity: ModelDictionary = try closeApproachData.mapField(withKey: ServerField.relative_velocity)
        let kms: String = try relativeVelocity.mapField(withKey: ServerField.kilometers_per_second)
        let kmh: String = try relativeVelocity.mapField(withKey: ServerField.kilometers_per_hour)
        let mph: String = try relativeVelocity.mapField(withKey: ServerField.miles_per_hour)

        let missDistance: ModelDictionary = try closeApproachData.mapField(withKey: ServerField.miss_distance)
        let astronomicalDist: String = try missDistance.mapField(withKey: ServerField.astronomical)
        let lunarDist: String = try missDistance.mapField(withKey: ServerField.lunar)
        let kilometersDist: String = try missDistance.mapField(withKey: ServerField.kilometers)
        let milesDist: String = try missDistance.mapField(withKey: ServerField.miles)

        let orbitalData = try getOrbitalData(from: dictionary)

        return Asteroid(id: id,
                        name: name,
                        date: date.convertFromServerFormatToDate(),
                        diameterKmMin: diameterKmMin,
                        diameterKmMax: diameterKmMax,
                        diameterMMin: diameterMMin,
                        diameterMMax: diameterMMax,
                        diameterMiMin: diameterMiMin,
                        diameterMiMax: diameterMiMax,
                        diameterFMin: diameterFMin,
                        diameterFMax: diameterFMax,
                        isItDangerous: isItDangerous,
                        velocityKms: kms,
                        velocityKmh: kmh,
                        velocityMph: mph,
                        distanceAstronomical: astronomicalDist,
                        distanceLunar: lunarDist,
                        distanceKm: kilometersDist,
                        distanceMi: milesDist,
                        orbitalData: orbitalData)
    }

    // MARK: Private helpers

    private func getOrbitalData(from dictionary: ModelDictionary) throws -> OrbitalData {

        let asteroidId: String = try dictionary.mapField(withKey: ServerField.id)

        let orbitalDataDict: ModelDictionary = try dictionary.mapField(withKey: ServerField.orbital_data)
        let orbitId: String = try orbitalDataDict.mapField(withKey: ServerField.orbit_id)
        let orbitDeterminationDate: String = try orbitalDataDict.mapField(withKey: ServerField.orbit_determination_date)
        let firstObservationDate: String = try orbitalDataDict.mapField(withKey: ServerField.first_observation_date)
        let lastObservationDate: String = try orbitalDataDict.mapField(withKey: ServerField.last_observation_date)
        let dataArcInDays: Int = try orbitalDataDict.mapField(withKey: ServerField.data_arc_in_days)
        let observationsUsed: Int = try orbitalDataDict.mapField(withKey: ServerField.observations_used)
        let orbitUncertainty: String = try orbitalDataDict.mapField(withKey: ServerField.orbit_uncertainty)
        let minimumOrbitIntersection: String = try orbitalDataDict.mapField(
            withKey: ServerField.minimum_orbit_intersection)
        let jupiterTisserandInvariant: String = try orbitalDataDict.mapField(
            withKey: ServerField.jupiter_tisserand_invariant)
        let epochOsculation: String = try orbitalDataDict.mapField(withKey: ServerField.epoch_osculation)
        let eccentricity: String = try orbitalDataDict.mapField(withKey: ServerField.eccentricity)
        let semiMajorAxis: String = try orbitalDataDict.mapField(withKey: ServerField.semi_major_axis)
        let inclination: String = try orbitalDataDict.mapField(withKey: ServerField.inclination)
        let ascendingNodeLongitude: String = try orbitalDataDict.mapField(withKey: ServerField.ascending_node_longitude)
        let orbitalPeriod: String = try orbitalDataDict.mapField(withKey: ServerField.orbital_period)
        let perihelionDistance: String = try orbitalDataDict.mapField(withKey: ServerField.perihelion_distance)
        let perihelionArgument: String = try orbitalDataDict.mapField(withKey: ServerField.perihelion_argument)
        let aphelionDistance: String = try orbitalDataDict.mapField(withKey: ServerField.aphelion_distance)
        let perihelionTime: String = try orbitalDataDict.mapField(withKey: ServerField.perihelion_time)
        let meanAnomaly: String = try orbitalDataDict.mapField(withKey: ServerField.mean_anomaly)
        let meanMotion: String = try orbitalDataDict.mapField(withKey: ServerField.mean_motion)
        let equinox: String = try orbitalDataDict.mapField(withKey: ServerField.equinox)

        let orbitClassDict: ModelDictionary = try orbitalDataDict.mapField(withKey: ServerField.orbit_class)
        let orbitClassType: String = try orbitClassDict.mapField(withKey: ServerField.orbit_class_type)
        let orbitClassDescription: String = try orbitClassDict.mapField(withKey: ServerField.orbit_class_description)
        let orbitClassRange: String = try orbitClassDict.mapField(withKey: ServerField.orbit_class_range)

        let orbitClass = OrbitClass(type: orbitClassType, range: orbitClassRange, descr: orbitClassDescription)
        let orbitalData = OrbitalData(asteroidId: asteroidId,
                                      orbitId: orbitId,
                                      orbitDaterminationDate: orbitDeterminationDate,
                                      firstObservationDate: firstObservationDate,
                                      lastObservationDate: lastObservationDate,
                                      dataArcInDays: dataArcInDays,
                                      observationUsed: observationsUsed,
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
                                      orbitalClass: orbitClass)
        return orbitalData
    }
}

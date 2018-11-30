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

        let id: String? = dictionary.mapOptionalField(withKey: ServerField.id)
        let name: String? = dictionary.mapOptionalField(withKey: ServerField.name)

        let estimatedDiameter: ModelDictionary? = dictionary.mapOptionalField(withKey: ServerField.estimated_diameter)
        let diameterInKm: ModelDictionary? = estimatedDiameter?.mapOptionalField(withKey: ServerField.kilometers)
        let diameterKmMin: Double? = diameterInKm?.mapOptionalField(withKey: ServerField.estimated_diameter_min)
        let diameterKmMax: Double? = diameterInKm?.mapOptionalField(withKey: ServerField.estimated_diameter_max)
        let diameterInM: ModelDictionary? = estimatedDiameter?.mapOptionalField(withKey: ServerField.meters)
        let diameterMMin: Double? = diameterInM?.mapOptionalField(withKey: ServerField.estimated_diameter_min)
        let diameterMMax: Double? = diameterInM?.mapOptionalField(withKey: ServerField.estimated_diameter_max)
        let diameterInMi: ModelDictionary? = estimatedDiameter?.mapOptionalField(withKey: ServerField.miles)
        let diameterMiMin: Double? = diameterInMi?.mapOptionalField(withKey: ServerField.estimated_diameter_min)
        let diameterMiMax: Double? = diameterInMi?.mapOptionalField(withKey: ServerField.estimated_diameter_max)
        let diameterInF: ModelDictionary? = estimatedDiameter?.mapOptionalField(withKey: ServerField.feet)
        let diameterFMin: Double? = diameterInF?.mapOptionalField(withKey: ServerField.estimated_diameter_min)
        let diameterFMax: Double? = diameterInF?.mapOptionalField(withKey: ServerField.estimated_diameter_max)

        let isItDangerous: Bool? = dictionary.mapOptionalField(withKey: ServerField.is_potentially_hazardous_asteroid)

        let closeApproachData: [[String: Any]]? = dictionary.mapOptionalField(
            withKey: ServerField.close_approach_data)
        let date: String? = closeApproachData?.first?.mapOptionalField(withKey: ServerField.close_approach_date)

        let relativeVelocity: ModelDictionary? = closeApproachData?.first?.mapOptionalField(
            withKey: ServerField.relative_velocity)
        let kms: String? = relativeVelocity?.mapOptionalField(withKey: ServerField.kilometers_per_second)
        let kmh: String? = relativeVelocity?.mapOptionalField(withKey: ServerField.kilometers_per_hour)
        let mph: String? = relativeVelocity?.mapOptionalField(withKey: ServerField.miles_per_hour)

        let missDistance: ModelDictionary? = closeApproachData?.first?.mapOptionalField(
            withKey: ServerField.miss_distance)
        let astronomicalDist: String? = missDistance?.mapOptionalField(withKey: ServerField.astronomical)
        let lunarDist: String? = missDistance?.mapOptionalField(withKey: ServerField.lunar)
        let kilometersDist: String? = missDistance?.mapOptionalField(withKey: ServerField.kilometers)
        let milesDist: String? = missDistance?.mapOptionalField(withKey: ServerField.miles)

        let orbitalData = try getOrbitalData(from: dictionary)

        return Asteroid(id: id ?? "Null",
                        name: name ?? "Null",
                        date: (date ?? "Null").convertFromServerFormatToDate(),
                        diameterKmMin: diameterKmMin ?? 0,
                        diameterKmMax: diameterKmMax ?? 0,
                        diameterMMin: diameterMMin ?? 0,
                        diameterMMax: diameterMMax ?? 0,
                        diameterMiMin: diameterMiMin ?? 0,
                        diameterMiMax: diameterMiMax ?? 0,
                        diameterFMin: diameterFMin ?? 0,
                        diameterFMax: diameterFMax ?? 0,
                        isItDangerous: isItDangerous ?? false,
                        velocityKms: kms ?? "Null",
                        velocityKmh: kmh ?? "Null",
                        velocityMph: mph ?? "Null",
                        distanceAstronomical: astronomicalDist ?? "Null",
                        distanceLunar: lunarDist ?? "Null",
                        distanceKm: kilometersDist ?? "Null",
                        distanceMi: milesDist ?? "Null",
                        orbitalData: orbitalData)
    }

    // MARK: Private helpers

    private func getOrbitalData(from dictionary: ModelDictionary) throws -> OrbitalData {

        let asteroidId: String? = dictionary.mapOptionalField(withKey: ServerField.id)

        let orbitalDataDict: ModelDictionary? = dictionary.mapOptionalField(withKey: ServerField.orbital_data)
        let orbitId: String? = orbitalDataDict?.mapOptionalField(withKey: ServerField.orbit_id)
        let orbitDeterminationDate: String? = orbitalDataDict?.mapOptionalField(
            withKey: ServerField.orbit_determination_date)
        let firstObservationDate: String? = orbitalDataDict?.mapOptionalField(
            withKey: ServerField.first_observation_date)
        let lastObservationDate: String? = orbitalDataDict?.mapOptionalField(withKey: ServerField.last_observation_date)
        let dataArcInDays: Int? = orbitalDataDict?.mapOptionalField(withKey: ServerField.data_arc_in_days)
        let observationsUsed: Int? = orbitalDataDict?.mapOptionalField(withKey: ServerField.observations_used)
        let orbitUncertainty: String? = orbitalDataDict?.mapOptionalField(withKey: ServerField.orbit_uncertainty)
        let minimumOrbitIntersection: String? = orbitalDataDict?.mapOptionalField(
            withKey: ServerField.minimum_orbit_intersection)
        let jupiterTisserandInvariant: String? = orbitalDataDict?.mapOptionalField(
            withKey: ServerField.jupiter_tisserand_invariant)
        let epochOsculation: String? = orbitalDataDict?.mapOptionalField(withKey: ServerField.epoch_osculation)
        let eccentricity: String? = orbitalDataDict?.mapOptionalField(withKey: ServerField.eccentricity)
        let semiMajorAxis: String? = orbitalDataDict?.mapOptionalField(withKey: ServerField.semi_major_axis)
        let inclination: String? = orbitalDataDict?.mapOptionalField(withKey: ServerField.inclination)
        let ascendingNodeLongitude: String? = orbitalDataDict?.mapOptionalField(
            withKey: ServerField.ascending_node_longitude)
        let orbitalPeriod: String? = orbitalDataDict?.mapOptionalField(withKey: ServerField.orbital_period)
        let perihelionDistance: String? = orbitalDataDict?.mapOptionalField(withKey: ServerField.perihelion_distance)
        let perihelionArgument: String? = orbitalDataDict?.mapOptionalField(withKey: ServerField.perihelion_argument)
        let aphelionDistance: String? = orbitalDataDict?.mapOptionalField(withKey: ServerField.aphelion_distance)
        let perihelionTime: String? = orbitalDataDict?.mapOptionalField(withKey: ServerField.perihelion_time)
        let meanAnomaly: String? = orbitalDataDict?.mapOptionalField(withKey: ServerField.mean_anomaly)
        let meanMotion: String? = orbitalDataDict?.mapOptionalField(withKey: ServerField.mean_motion)
        let equinox: String? = orbitalDataDict?.mapOptionalField(withKey: ServerField.equinox)

        let orbitClassDict: ModelDictionary? = orbitalDataDict?.mapOptionalField(withKey: ServerField.orbit_class)
        let orbitClassType: String? = orbitClassDict?.mapOptionalField(withKey: ServerField.orbit_class_type)
        let orbitClassDescription: String? = orbitClassDict?.mapOptionalField(
            withKey: ServerField.orbit_class_description)
        let orbitClassRange: String? = orbitClassDict?.mapOptionalField(withKey: ServerField.orbit_class_range)

        let orbitClass = OrbitClass(type: orbitClassType ?? "Null",
                                    range: orbitClassRange ?? "Null",
                                    descr: orbitClassDescription ?? "Null")
        let orbitalData = OrbitalData(asteroidId: asteroidId ?? "Null",
                                      orbitId: orbitId ?? "Null",
                                      orbitDaterminationDate: orbitDeterminationDate ?? "Null",
                                      firstObservationDate: firstObservationDate ?? "Null",
                                      lastObservationDate: lastObservationDate ?? "Null",
                                      dataArcInDays: dataArcInDays ?? 0,
                                      observationUsed: observationsUsed ?? 0,
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
}

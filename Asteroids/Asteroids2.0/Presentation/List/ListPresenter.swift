//
//  ListPresenter.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

protocol ListPresentationLogic: AsyncPresentationLogic {
    func presentAsteroidsSuccess(response: List.Asteroids.Response.Success)
    func presentAsteroidsFailure(response: List.Asteroids.Response.Failure)
}

final class ListPresenter: ListPresentationLogic, AsyncPresentationLogicInternal {

    typealias DisplayLogic = ListDisplayLogic

    // MARK: Properties

    weak var viewController: ListDisplayLogic?

    // MARK: Initialization

    init(
        viewController: ListDisplayLogic
        ) {
        self.viewController = viewController
    }

    // MARK: ListPresentationLogic

    func presentAsteroidsSuccess(response: List.Asteroids.Response.Success) {
        var displayedAsteroids: [DisplayedAsteroids] = []

        for asteroid in response.asteroids {

            let sectionTitle = asteroid.date.convertToDisplayString()
            if let foundIndex = displayedAsteroids.index(where: {
                return ($0.title == sectionTitle)
            }) {
                let asteroid = AsteroidViewModel(asteroid: asteroid)
                displayedAsteroids[foundIndex].asteroids.append(asteroid)
            } else {
                var section = DisplayedAsteroids(with: sectionTitle)
                let asteroid = AsteroidViewModel(asteroid: asteroid)
                section.asteroids.append(asteroid)
                displayedAsteroids.append(section)
            }

        }

        let viewModel = List.Asteroids.ViewModel.Success(displayedAsteroids: displayedAsteroids)
        viewController?.displayAsteroidsSuccess(viewModel: viewModel)
    }

    func presentAsteroidsFailure(response: List.Asteroids.Response.Failure) {
        let errorViewModel = ErrorViewModel(error: response.error)
        let viewModel = List.Asteroids.ViewModel.Failure(errorViewModel: errorViewModel)
        viewController?.displayAsteroidsFailure(viewModel: viewModel)
    }
}

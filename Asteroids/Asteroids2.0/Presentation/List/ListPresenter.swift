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
        var asteroids: [AsteroidViewModel] = []

        for asteroid in response.asteroids {
            let viewModel = AsteroidViewModel(asteroid: asteroid)
            asteroids.append(viewModel)
        }

        let viewModel = List.Asteroids.ViewModel.Success(asteroidsViewModel: asteroids)
        viewController?.displayAsteroidsSuccess(viewModel: viewModel)
    }

    func presentAsteroidsFailure(response: List.Asteroids.Response.Failure) {
        let errorViewModel = ErrorViewModel(error: response.error)
        let viewModel = List.Asteroids.ViewModel.Failure(errorViewModel: errorViewModel)
        viewController?.displayAsteroidsFailure(viewModel: viewModel)
    }
}

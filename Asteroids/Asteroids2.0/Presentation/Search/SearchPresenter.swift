//
//  SearchPresenter.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic: AsyncPresentationLogic {}

final class SearchPresenter: SearchPresentationLogic, AsyncPresentationLogicInternal {

    typealias DisplayLogic = SearchDisplayLogic

    // MARK: Properties

    weak var viewController: SearchDisplayLogic?

    // MARK: Initialization

    init(
        viewController: SearchDisplayLogic
        ) {
        self.viewController = viewController
    }

    // MARK: SearchPresentationLogic
}

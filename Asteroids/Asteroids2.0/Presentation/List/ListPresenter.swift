//
//  ListPresenter.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

protocol ListPresentationLogic: AsyncPresentationLogic {}

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
}

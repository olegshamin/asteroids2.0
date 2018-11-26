//
//  SearchInteractor.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

protocol SearchBusinessLogic {}

protocol SearchDataStore {}

final class SearchInteractor: SearchBusinessLogic, SearchDataStore {

    // MARK: Properties

    var presenter: SearchPresentationLogic

    // MARK: SearchDataStore

    // MARK: Initialization

    init(
        presenter: SearchPresentationLogic
        ) {
        self.presenter = presenter
    }

    // MARK: SearchBusinessLogic
}

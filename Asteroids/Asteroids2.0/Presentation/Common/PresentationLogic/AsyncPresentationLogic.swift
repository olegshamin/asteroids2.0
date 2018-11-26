//
//  AsyncPresentationLogic.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

/// Base presentation logic protocol for modules with async operations, e.g. network requests
protocol AsyncPresentationLogic {
    func presentLoading()
    func presentContent()
}

/// Internal base presentation logic protocol for modules with async operations, e.g. network requests.
/// - Used to reduce duplicated code of calling appropriate methods of view controller
/// presentLoading -> displayLoading and presentContent -> displayContent.
/// - Only presenter implementations should conform to this protocol to avoid
/// 'Protocol can only be used as a generic constraint because it has Self or associated type requirements error'.
/// For example: final class SomePresenter: SomePresentationLogic, AsyncPresentationLogicInternal {...}
protocol AsyncPresentationLogicInternal {
    associatedtype DisplayLogic
    var viewController: DisplayLogic? { get }
}

extension AsyncPresentationLogicInternal {
    func presentLoading() {
        (viewController as? AsyncDisplayLogic)?.displayLoading()
    }

    func presentContent() {
        (viewController as? AsyncDisplayLogic)?.displayContent()
    }
}

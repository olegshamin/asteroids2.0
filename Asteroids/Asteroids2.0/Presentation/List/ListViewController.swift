//
//  ListViewController.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

protocol ListDisplayLogic: class {}

final class ListViewController: ViewController {

    // MARK: Properties

    var interactor: ListBusinessLogic?
    var router: (ListRoutingLogic & ListDataPassing)?

    // MARK: IBOutlets

    // MARK: Assembly

    override func assembly() -> Assembly {
        return ListAssemblyImpl()
    }

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchAsteroids()
    }

    // MARK: Data

    private func fetchAsteroids() {
        let request = List.Asteroids.Request()
        interactor?.asteroids(request: request)
    }
}

extension ListViewController: ListDisplayLogic {}

//
//  SearchViewController.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

protocol SearchDisplayLogic: class {}

final class SearchViewController: ViewController {

    // MARK: Properties

    var interactor: SearchBusinessLogic?
    var router: (SearchRoutingLogic & SearchDataPassing)?

    // MARK: IBOutlets

    // MARK: Assembly

    override func assembly() -> Assembly {
        return SearchAssemblyImpl()
    }

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SearchViewController: SearchDisplayLogic {}

//
//  SettingsViewController.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

protocol SettingsDisplayLogic: class {}

final class SettingsViewController: ViewController {

    // MARK: Properties

    var interactor: SettingsBusinessLogic?
    var router: (SettingsRoutingLogic & SettingsDataPassing)?

    // MARK: IBOutlets

    // MARK: Assembly

    override func assembly() -> Assembly {
        return SettingsAssemblyImpl()
    }

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SettingsViewController: SettingsDisplayLogic {}

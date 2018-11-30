//
//  ListViewController.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

protocol ListDisplayLogic: class {
    func displayAsteroidsSuccess(viewModel: List.Asteroids.ViewModel.Success)
    func displayAsteroidsFailure(viewModel: List.Asteroids.ViewModel.Failure)
}

final class ListViewController: ViewController {

    // MARK: Properties

    var interactor: ListBusinessLogic?
    var router: (ListRoutingLogic & ListDataPassing)?
    private var asteroids: [AsteroidViewModel] = []

    // MARK: IBOutlets

    @IBOutlet var tableView: UITableView!

    // MARK: Assembly

    override func assembly() -> Assembly {
        return ListAssemblyImpl()
    }

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchAsteroids()
    }

    // MARK: Private helpers

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(AsteroidCell.self)
    }

    // MARK: Data

    private func fetchAsteroids() {
        let request = List.Asteroids.Request()
        interactor?.asteroids(request: request)
    }
}

extension ListViewController: ListDisplayLogic {

    func displayAsteroidsSuccess(viewModel: List.Asteroids.ViewModel.Success) {
        asteroids = viewModel.asteroidsViewModel
        tableView.reloadData()
    }

    func displayAsteroidsFailure(viewModel: List.Asteroids.ViewModel.Failure) {
        display(errorViewModel: viewModel.errorViewModel)
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return asteroids.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AsteroidCell = tableView.dequeue(for: indexPath)

        cell.setup(with: asteroids[indexPath.row])

        return cell
    }
}

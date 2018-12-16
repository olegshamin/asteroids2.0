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
    private var displayedAsteroids: [DisplayedAsteroids] = []
    private let  tableFooterSpinnerView = SpinnerView.fromNib()

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
        setupTableView()
    }

    // MARK: Private helpers

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AsteroidCell.self)
        tableView.tableFooterView = tableFooterSpinnerView
    }

    // MARK: Data

    private func fetchAsteroids() {
        tableFooterSpinnerView.spinner.startAnimating()
        let request = List.Asteroids.Request()
        interactor?.asteroids(request: request)
    }
}

extension ListViewController: ListDisplayLogic {

    func displayAsteroidsSuccess(viewModel: List.Asteroids.ViewModel.Success) {
        if viewModel.displayedAsteroids.count > 0 {
            displayedAsteroids += viewModel.displayedAsteroids
            tableView.reloadData()
        }
        tableFooterSpinnerView.spinner.stopAnimating()
    }

    func displayAsteroidsFailure(viewModel: List.Asteroids.ViewModel.Failure) {
        display(errorViewModel: viewModel.errorViewModel)
        tableFooterSpinnerView.spinner.stopAnimating()
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return displayedAsteroids.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = displayedAsteroids[section]
        return section.asteroids.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AsteroidCell = tableView.dequeue(for: indexPath)

        let section = displayedAsteroids[indexPath.section]
        cell.setup(with: section.asteroids[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        let cellsCountBeforeEnd = 1
        let isLastSection = (section == displayedAsteroids.count - 1)
        let isListAboutToEnd =
            (isLastSection) &&
            (row == displayedAsteroids[section].asteroids.count - cellsCountBeforeEnd )
        if isListAboutToEnd {
            fetchAsteroids()
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 50))
        headerView.backgroundColor = .white

        let titleLabel = UILabel()
        headerView.addSubview(titleLabel)

        titleLabel.align(to: .zero, of: headerView)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.text = displayedAsteroids[section].title

        return headerView
    }
}

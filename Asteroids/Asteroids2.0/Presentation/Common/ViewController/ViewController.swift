//
//  ViewController.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AsyncDisplayLogic {

    // MARK: Internal Properties

    let spinner = UIActivityIndicatorView(style: .gray)
    let spinnerView = UIView()

    // MARK: Initialization

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        assembly().configure(viewController: self)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        assembly().configure(viewController: self)
    }

    // MARK: Assembly

    func assembly() -> Assembly {
        fatalError("View controller's assembly is not implemented")
    }

    // MARK: Routing

    var segueHandler: NSObjectProtocol?

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Fix popover anchor position https://stackoverflow.com/a/33724019
        segue.destination.popoverPresentationController?.sourceRect = (sender as? UIView)?.bounds ?? .zero
        guard let segueHandler = segueHandler else {
            return
        }
        guard let selectorName = segue.identifier else {
            return
        }
        let selector = NSSelectorFromString("routeTo\(selectorName)WithSegue:")
        guard segueHandler.responds(to: selector) else {
            return
        }
        segueHandler.perform(selector, with: segue)
    }

    func performSegue(for type: UIViewController.Type, sender: Any?) {
        performSegue(withIdentifier: String(describing: type), sender: sender)
    }

    // MARK: Private Properties

    private var keyboardWillShowObserver: NSObjectProtocol?
    private var keyboardWillHideObserver: NSObjectProtocol?

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSpinnerView()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerKeyboardNotificationObservers()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardNotificationObservers()
    }

    // MARK: Internal Helpers

    func keyboardWillShow(keyboardHeight: CGFloat) {}
    func keyboardWillHide(keyboardHeight: CGFloat) {}

    func displayLoading() {
        view.bringSubviewToFront(spinnerView)
        spinnerView.bringSubviewToFront(spinner)
        spinnerView.isHidden = false
        spinner.startAnimating()
    }

    func displayContent() {
        spinnerView.isHidden = true
        spinner.stopAnimating()
    }

    // MARK: Private Helpers

    private func setupSpinnerView() {
        spinnerView.addSubview(spinner)
        view.addSubview(spinnerView)
        spinner.hidesWhenStopped = true
        spinnerView.backgroundColor = .hexFFFFFF
        spinnerView.isHidden = true
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            spinnerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            spinnerView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            spinnerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinnerView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ]
        NSLayoutConstraint.activate(constraints)

        spinner.alignCentered(in: spinnerView)
    }

    private func registerKeyboardNotificationObservers() {
        let center = NotificationCenter.default
        keyboardWillShowObserver = center.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: .main
        ) { [weak self] notification in
            self?.keyboardWillShow(keyboardHeight: notification.keyboardHeight)
        }
        keyboardWillHideObserver = center.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: .main
        ) { [weak self] notification in
            self?.keyboardWillHide(keyboardHeight: notification.keyboardHeight)
        }
    }

    private func removeKeyboardNotificationObservers() {
        let center = NotificationCenter.default
        if let keyboardWillShowObserver = keyboardWillShowObserver {
            center.removeObserver(keyboardWillShowObserver)
            self.keyboardWillShowObserver = nil
        }
        if let keyboardWillHideObserver = keyboardWillHideObserver {
            center.removeObserver(keyboardWillHideObserver)
            self.keyboardWillHideObserver = nil
        }
    }
}

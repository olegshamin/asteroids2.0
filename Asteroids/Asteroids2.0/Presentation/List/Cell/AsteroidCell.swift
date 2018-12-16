//
//  AsteroidCell.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 30/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

class AsteroidCell: UITableViewCell, NibLoadable {

    // MARK: IBOutlets

    @IBOutlet var backView: UIView!
    @IBOutlet var labelDiameter: UILabel!
    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelDistance: UILabel!
    @IBOutlet var labelVelocity: UILabel!

    // MARK: Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()

        setupBackView()
    }

    // MARK: Internal helpers

    func setup(with asteroid: AsteroidViewModel) {
        labelDiameter.text = asteroid.diameter
        labelName.text = asteroid.name
        labelDistance.text = asteroid.distance
        labelVelocity.text = asteroid.velocity
    }

    // MARK: Appearance

    private func setupBackView() {
        backView.layer.cornerRadius = 8
        backView.layer.shadowColor = UIColor.gray.cgColor
        backView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        backView.layer.shadowRadius = 9.0
        backView.layer.shadowOpacity = 0.7
    }
}

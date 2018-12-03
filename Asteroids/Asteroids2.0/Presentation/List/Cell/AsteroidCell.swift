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

    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelDistance: UILabel!

    // MARK: Internal helpers

    func setup(with asteroid: AsteroidViewModel) {
        labelName.text = asteroid.name
        labelDistance.text = asteroid.distance
    }
}

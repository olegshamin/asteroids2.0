//
//  Asteroid.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 18/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation
import RealmSwift

final class Asteroid: Object {

    // MARK: Properties

    @objc dynamic var id: String = ""

    override static func primaryKey() -> String? {
        return #keyPath(Asteroid.id)
    }

    // MARK: Initialization

    convenience init(
        id: String
        ) {
        self.init()
        self.id = id
    }
}

// MARK: Decodable

extension Asteroid: Decodable {

    enum Keys: String, CodingKey {
        case id
    }

    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        let id: String = try container.decode(String.self, forKey: .id)

        self.init(id: id)
    }
}

// MARK: Equatable

extension Asteroid {
    static func == (lhs: Asteroid, rhs: Asteroid) -> Bool {
        return lhs.id == rhs.id
    }
}

//
//  Mapper.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 29/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

/// Protocol for mapping entities
protocol Mapper {
    associatedtype InputModel
    associatedtype OutputModel

    func map(_ inputModel: InputModel) throws -> OutputModel
    func map(_ outputModel: OutputModel) throws -> InputModel
}

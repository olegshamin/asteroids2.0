//
//  Scheduler.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

/// Protocol for scheduling tasks in background and on main thread
/// If a service (or other entity) needs to perform work in background or on main thread
/// an entity implementing this protocol should be injected into it and used
public protocol Scheduler: class {
    func doOnMainThread(block: @escaping () -> Void)
    func doInBg(block: @escaping () -> Void)
}

//
//  GCDScheduler.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

/// Implementation of Scheduler protocol using Grand Central Dispatch.
public final class GCDScheduler: Scheduler {

    // MARK: Scheduler

    public func doOnMainThread(block: @escaping () -> Void) {
        DispatchQueue.main.async(execute: block)
    }

    public func doInBg(block: @escaping () -> Void) {
        DispatchQueue.global(qos: .default).async(execute: block)
    }
}

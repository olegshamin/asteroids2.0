//
//  Transport.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

typealias TransportResponseResult = Result<TransportResponse>
typealias TransportResponseResultHandler = (TransportResponseResult) -> Void

/// Protocol for performing URL requests.
/// Performs requests asynchronously.
/// Completion block is called on success/failure,
/// which contains raw data and HTTPURLResponse object.
protocol Transport: class {
    func perform(urlRequest: URLRequest, completion: @escaping TransportResponseResultHandler)
}

extension Transport {

    func perform(request: Request, completion: @escaping TransportResponseResultHandler) {
        do {
            let urlRequest = try request.asURLRequest()
            self.perform(urlRequest: urlRequest, completion: completion)
        } catch {
            completion(.failure(error))
        }
    }
}

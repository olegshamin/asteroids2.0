//
//  NetworkRepository.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

protocol NetworkRepository: Repository {
    var transport: Transport { get }
}

extension NetworkRepository {

    ///
    /// Use this helper to avoid transport response result switches
    /// and status code checks/switches in every response
    ///
    /// - Parameters:
    ///   - result: transport response result
    ///   - completion: completion handlers, which will be called direcrly in case of an error
    ///   - successHandler: success handler with response data parateter
    /// which will be called in case the status code is [200;300)
    func handle<T>(
        transportResponseResult result: Result<TransportResponse>,
        completion: @escaping ResultHandler<T>,
        successHandler: (Data) -> Void
        ) {
        switch result {
        case .success(let transportResponse):
            handle(
                transportResponse: transportResponse,
                completion: completion,
                successHandler: successHandler
            )
        case .failure(let error):
            handle(error: error, completion: completion)
        }
    }

    // MARK: Void Transport Response Result handler

    func handle(
        voidTransportResult transportResult: Result<TransportResponse>,
        completion: @escaping VoidResultHandler
        ) {
        handle(transportResponseResult: transportResult, completion: completion) { _ in
            handle(success: (), completion: completion)
        }
    }

    // MARK: Private Helpers

    private func handle<T>(
        transportResponse: TransportResponse,
        completion: @escaping ResultHandler<T>,
        successHandler: (Data) -> Void
        ) {
        let statusCode = transportResponse.response.statusCode
        switch statusCode {
        case 200..<300:
            successHandler(transportResponse.data)
        case 400..<500:
            handleResponseError(data: transportResponse.data, completion: completion)
        case 500..<600:
            handle(error: TransportError.internalServerError, completion: completion)
        default:
            break
        }
    }

    // MARK: Error Handlers

    private func handleResponseError<T>(data: Data, completion: @escaping ResultHandler<T>) {
        do {
            let decoder = JSONDecoder()
            let requestError = try decoder.decode(RequestError.self, from: data)
            handle(error: requestError, completion: completion)
        } catch {
            handle(error: error, completion: completion)
        }
    }
}

//
//  AlamofireTransport.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation
import Alamofire

/// Implementation of transport protocol using Alamofire.
final class AlamofireTransport: Transport {

    // MARK: Private Properties

    private let sessionManager: SessionManager

    // MARK: Initialization

    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = .requestTimeout
        sessionManager = SessionManager(
            configuration: configuration
        )
    }

    // MARK: Transport

    func perform(urlRequest: URLRequest, completion: @escaping TransportResponseResultHandler) {
        sessionManager.request(urlRequest).responseData { [weak self] response in
            self?.handle(transportResponse: response, completion: completion)
        }
    }

    // MARK: Private Helpers

    private func handle(
        transportResponse: DataResponse<Data>,
        completion: @escaping TransportResponseResultHandler
        ) {
        switch transportResponse.result {
        case .success(let data):
            guard let response = transportResponse.response else {
                completion(.failure(TransportError.invalidResponse))
                return
            }
            completion(.success(TransportResponse(data: data, response: response)))
        case .failure(let error):
            let requestError = TransportError.requestFailed(underlyingError: error)
            completion(.failure(requestError))
        }
    }
}

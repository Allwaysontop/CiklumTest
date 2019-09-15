//
//  CountriesFeedAPIImpl.swift
//  CiklumTest
//
//  Created by Kramarchuk Kyrylo on 9/15/19.
//  Copyright © 2019 Kramarchuk Kyrylo. All rights reserved.
//

import Foundation

class CountriesFeedAPIImpl: CountriesFeedAPIType {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService = .init()) {
        self.networkService = networkService
    }
    
    func loadCountries(completion: @escaping (NetworkService.NetworkResult) -> Void) {
        let endpoint: Endpoint = .all
        guard let requestURL = URL(string: endpoint.url) else {
            assertionFailure("Check URL")
            return
        }
        
        networkService.request(url: requestURL, method: .get, completion: completion)
    }
}

extension CountriesFeedAPIImpl {
    
    enum Endpoint {
        case all
        
        var url: String {
            switch self {
            case .all: return NetworkService.Constants.baseURL + NetworkService.Constants.all
            }
        }
        
        var method: NetworkService.HTTPMethod {
            switch self {
            case .all: return .get
            }
        }
    }
}

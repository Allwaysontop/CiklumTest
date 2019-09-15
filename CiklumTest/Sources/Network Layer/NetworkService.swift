//
//  NetworkService.swift
//  CiklumTest
//
//  Created by Kramarchuk Kyrylo on 9/15/19.
//  Copyright © 2019 Kramarchuk Kyrylo. All rights reserved.
//

import Foundation

class NetworkService {
    
    private let session: URLSession
    
    // MARK: - Life cycle
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request(url: URL, method: HTTPMethod, completion: @escaping (NetworkResult) -> Void) {
        let task = session.dataTask(with: url) { data, URLResponse, error in
            guard let data = data else {
                let error = error ?? NetworkError.unknownError(message: "Something went wrong")
                completion(.failure(error: error))
                return
            }
            completion(.success(data: data))
        }
        task.resume()
    }
}

extension NetworkService {
    
    enum NetworkError: Error {
        case unknownError(message: String?)
    }
    
    enum NetworkResult {
        case success(data: Data)
        case failure(error: Error)
    }
    
    enum HTTPMethod: String {
        case get = "GET"
    }
    
    enum Constants {
        static let baseURL: String = "https://restcountries.eu/rest/v2/"
        static let all: String = "all"
    }
}

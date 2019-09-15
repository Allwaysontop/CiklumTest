//
//  CountriesFeedAPIType.swift
//  CiklumTest
//
//  Created by Kramarchuk Kyrylo on 9/15/19.
//  Copyright © 2019 Kramarchuk Kyrylo. All rights reserved.
//

import Foundation

protocol CountriesFeedAPIType: class {
    
    /// Load countries from REST API
    ///
    /// - Parameter completion: either 'success' with Data, either 'failure' with Error
    func loadCountries(completion: @escaping (NetworkService.NetworkResult) -> Void)
}

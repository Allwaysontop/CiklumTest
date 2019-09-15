//
//  CountriesFeedParserType.swift
//  CiklumTest
//
//  Created by Kramarchuk Kyrylo on 9/15/19.
//  Copyright © 2019 Kramarchuk Kyrylo. All rights reserved.
//

import Foundation

protocol CountriesFeedParserType: class {
    
    /// Parse countries from Data into CountryEntity array
    ///
    /// - Parameter data: incoming data from REST API
    /// - Returns: parsed array of CountryEntity
    func parseCountries(from data: Data) -> [CountryEntity]
}

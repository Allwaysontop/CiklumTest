//
//  CountriesFeedParserImpl.swift
//  CiklumTest
//
//  Created by Kramarchuk Kyrylo on 9/15/19.
//  Copyright © 2019 Kramarchuk Kyrylo. All rights reserved.
//

import Foundation

class CountriesFeedParserImpl: CountriesFeedParserType {
    
    func parseCountries(from data: Data) -> [CountryEntity] {
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode([CountryEntity].self, from: data)
            return decoded
        } catch {
            assertionFailure("Decodinf from data to [CountryEntity] fails")
            return []
        }
    }
}

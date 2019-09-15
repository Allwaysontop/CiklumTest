//
//  CountryEntity.swift
//  CiklumTest
//
//  Created by Kramarchuk Kyrylo on 9/15/19.
//  Copyright © 2019 Kramarchuk Kyrylo. All rights reserved.
//

import Foundation

struct CountryEntity: Codable {
    let nameEnglish: String
    let nameLocal: String
    let population: UInt32
    let nationalFlag: String
    
    enum CodingKeys: String, CodingKey {
        case nameEnglish = "name"
        case nameLocal = "nativeName"
        case population = "population"
        case nationalFlag = "flag"
    }
}

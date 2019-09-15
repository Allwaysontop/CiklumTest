//
//  CountriesFeedViewData.swift
//  CiklumTest
//
//  Created by Kramarchuk Kyrylo on 9/15/19.
//  Copyright © 2019 Kramarchuk Kyrylo. All rights reserved.
//

import Foundation

protocol CountriesFeedItem {
    var nameEnglish: String { get }
    var nameLocal: String { get }
    var population: UInt32 { get }
    var nationalFlagUrl: String { get }
}

// MARK: - CountriesFeedItem

extension CountryEntity: CountriesFeedItem {
    var nationalFlagUrl: String {
        return self.nationalFlag
    }
}

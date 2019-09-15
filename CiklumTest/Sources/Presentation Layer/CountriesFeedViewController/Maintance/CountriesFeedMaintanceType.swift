//
//  CountriesFeedMaintanceType.swift
//  CiklumTest
//
//  Created by Kramarchuk Kyrylo on 9/16/19.
//  Copyright © 2019 Kramarchuk Kyrylo. All rights reserved.
//

import Foundation

protocol CountriesFeedMaintanceDelegate: class {
    func countriesFeedMaintanceDidSelect(item: CountriesFeedItem)
}

protocol CountriesFeedMaintanceType: class {
    func loadData()
    func reloadData()
}

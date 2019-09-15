//
//  CountriesFeedManager.swift
//  CiklumTest
//
//  Created by Kramarchuk Kyrylo on 9/15/19.
//  Copyright © 2019 Kramarchuk Kyrylo. All rights reserved.
//

import Foundation

class CountriesFeedManager {
    
    let parser: CountriesFeedParserType
    let api: CountriesFeedAPIType
    var dataSourceItems: [CountriesFeedItem] = []
    
    init(api: CountriesFeedAPIType, parser: CountriesFeedParserType) {
        self.api = api
        self.parser = parser
    }
    
    func loadCountries(completion: @escaping ([CountriesFeedItem], Error?) -> Void) {
        api.loadCountries { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let data):
                let parsed = strongSelf.parser.parseCountries(from: data)
                let mapped: [CountriesFeedItem] = parsed.map({ $0 })
                strongSelf.dataSourceItems = mapped
                completion(mapped, nil)
            case .failure(let error):
                completion([], error)
            }
        }
    }
}

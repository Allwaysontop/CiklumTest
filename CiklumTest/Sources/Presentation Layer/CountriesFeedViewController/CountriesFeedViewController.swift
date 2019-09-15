//
//  CountriesFeedViewController.swift
//  CiklumTest
//
//  Created by Kramarchuk Kyrylo on 9/15/19.
//  Copyright © 2019 Kramarchuk Kyrylo. All rights reserved.
//

import Foundation
import UIKit

class CountriesFeedViewController: UIViewController {
    
    var maintance: CountriesFeedMaintanceType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        loadCountries()
    }
    
    // MARK: - Private
    
    private func initialSetup() {
        title = NSLocalizedString("List of countries", comment: "")
        // Change backButton title in next controller
        navigationItem.backBarButtonItem = UIBarButtonItem(title: NSLocalizedString("back", comment: ""),
                                                           style: .plain,
                                                           target: self,
                                                           action: nil)
        let manager = CountriesFeedManager(api: CountriesFeedAPIImpl(), parser: CountriesFeedParserImpl())
        maintance = CountriesFeedMaintanceImpl(initialView: self.view, manager: manager, delegate: self)
    }
    
    private func loadCountries() {
        maintance.loadData()
    }
}

// MARK: - CountriesFeedMaintanceDelegate

extension CountriesFeedViewController: CountriesFeedMaintanceDelegate {
    
    func countriesFeedMaintanceDidSelect(item: CountriesFeedItem) {
        openCountriesDetailViewController(with: item)
    }
}

// MARK: - Routing

extension CountriesFeedViewController {
    
    func openCountriesDetailViewController(with item: CountriesFeedItem) {
        let storyboard = UIStoryboard(name: "CountriesDetail", bundle: .main)
        guard let controller = storyboard.instantiateViewController(withIdentifier: String(describing: CountriesDetailViewController.self)) as? CountriesDetailViewController else {
            return
        }
        controller.countryItem = item
        navigationController?.pushViewController(controller, animated: true)
    }
}



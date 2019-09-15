//
//  CountriesDetailViewController.swift
//  CiklumTest
//
//  Created by Kramarchuk Kyrylo on 9/15/19.
//  Copyright © 2019 Kramarchuk Kyrylo. All rights reserved.
//

import Foundation
import UIKit

class CountriesDetailViewController: UIViewController {
    
    @IBOutlet private weak var nameEnglishLabel: UILabel!
    @IBOutlet private weak var nameLocalLabel: UILabel!
    @IBOutlet private weak var populationLabel: UILabel!
    @IBOutlet private weak var nationalFlagImageView: UIImageView!
    
    var countryItem: CountriesFeedItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    
    // MARK: - Private
    
    private func initialSetup() {
        title = NSLocalizedString(countryItem.nameEnglish, comment: "")
        nameEnglishLabel.text = countryItem.nameEnglish
        nameLocalLabel.text = countryItem.nameLocal
        populationLabel.text = String(countryItem.population)
//        nationalFlagImageView.image =
    }
}

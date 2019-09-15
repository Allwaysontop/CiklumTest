//
//  CountriesFeedCell.swift
//  CiklumTest
//
//  Created by Kramarchuk Kyrylo on 9/15/19.
//  Copyright © 2019 Kramarchuk Kyrylo. All rights reserved.
//

import Foundation
import UIKit

class CountriesFeedCell: UICollectionViewCell {
    
    @IBOutlet private weak var nameEnglishLabel: UILabel!
    @IBOutlet private weak var nameLocalLabel: UILabel!
    @IBOutlet private weak var populationLabel: UILabel!
    @IBOutlet private weak var nationalFlagImageView: UIImageView!
    
    func configure(model: CountriesFeedItem) {
        nameEnglishLabel.text = model.nameEnglish
        nameLocalLabel.text = model.nameLocal
        populationLabel.text = String(model.population)
        setupImage(with: model.nationalFlagUrl)
    }
    
    // MARK: - Private
    
    private func setupImage(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        ImageService.loadImage(from: url) { [weak self] completion in
            let (image, urlString) = completion
            guard let loadedImage = image, url.absoluteString == urlString else { return }
            
            self?.nationalFlagImageView.image = loadedImage
        }
    }
}

extension CountriesFeedCell {
    
    class func height(boundingIn width: CGFloat, item: CountriesFeedItem) -> CGFloat {
        let verticalOffsets: CGFloat = 8 + 5 + 5 + 8
        let horizontalOffsets: CGFloat = 16 + 40 + 15 + 16
        let correctedWidth = width - horizontalOffsets
        
        let nameEnglishHeight = item.nameEnglish.height(constraintedWidth: correctedWidth, font: UIFont.systemFont(ofSize: 15))
        let nameLocalHeight = item.nameLocal.height(constraintedWidth: correctedWidth, font: UIFont.systemFont(ofSize: 15))
        let populationHeight = String(item.population).height(constraintedWidth: correctedWidth, font: UIFont.systemFont(ofSize: 12))
        let result = nameEnglishHeight + nameLocalHeight + populationHeight + verticalOffsets
        return result
    }
}

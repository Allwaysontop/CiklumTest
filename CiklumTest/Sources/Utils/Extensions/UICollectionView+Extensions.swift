//
//  UICollectionView+Extensions.swift
//  CiklumTest
//
//  Created by Kramarchuk Kyrylo on 9/15/19.
//  Copyright © 2019 Kramarchuk Kyrylo. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func dequeueReusableItem<T: UICollectionViewCell>(of type: T.Type, for indexPath: IndexPath) -> T {
        let identifier = String(describing: type)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T else {
            preconditionFailure("Failed to dequeueReusableCell for \(identifier)")
        }
        return cell
    }
    
    func registerNib(for cellType: UICollectionViewCell.Type, bundle: Bundle? = .main) {
        let name = String(describing: cellType)
        self.register(UINib(nibName: name, bundle: bundle), forCellWithReuseIdentifier: name)
    }
}

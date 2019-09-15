//
//  UIView+Extensions.swift
//  CiklumTest
//
//  Created by Kramarchuk Kyrylo on 9/15/19.
//  Copyright © 2019 Kramarchuk Kyrylo. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func add(into container: UIView, insets: UIEdgeInsets = .zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self)
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: container.topAnchor, constant: insets.top),
            self.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: insets.bottom),
            self.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: insets.left),
            self.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: insets.right)
        ])
    }
}

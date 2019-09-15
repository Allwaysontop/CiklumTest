//
//  ImageCache.swift
//  CiklumTest
//
//  Created by Kramarchuk Kyrylo on 9/16/19.
//  Copyright © 2019 Kramarchuk Kyrylo. All rights reserved.
//

import Foundation
import UIKit

class ImageCache {
    
    private let cache = NSCache<NSString, UIImage>()
    
    func save(image: UIImage, for key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func getImage(for key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
}

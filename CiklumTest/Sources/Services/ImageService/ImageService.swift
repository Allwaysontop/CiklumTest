//
//  ImageService.swift
//  CiklumTest
//
//  Created by Kramarchuk Kyrylo on 9/16/19.
//  Copyright © 2019 Kramarchuk Kyrylo. All rights reserved.
//

import Foundation
import UIKit

class ImageService {
    
    typealias ImageServiceCompletion = (image: UIImage?, urlString: String)
    
    private static let cache = ImageCache()
    
    class func loadImage(from url: URL, with service: NetworkService = .init(), completion: @escaping (ImageServiceCompletion) -> Void) {
        
        func failedCompletion(url: URL, completion: @escaping (ImageServiceCompletion) -> Void) {
            let result: ImageServiceCompletion = (nil, url.absoluteString)
            DispatchQueue.main.async {
                completion(result)
            }
        }
        
        DispatchQueue.global(qos: .background).async {
            if let cachedImage = cache.getImage(for: url.absoluteString) {
                DispatchQueue.main.async {
                    let result: ImageServiceCompletion = (cachedImage, url.absoluteString)
                    completion(result)
                }
            } else {
                service.request(url: url, method: .get, completion: { result in
                    switch result {
                    case .success(let data):
                        // FIXME: Becasue of SVG format, there is no image :(
                        // Trying to implement SVGKit, but it's slow and it
                        // modifying the autolayout engine from a background thread after the engine was accessed from the main thread.
                        // There is a way to use WKWebView in every cell, but it's very slow and inefficient
                        if let image = UIImage(data: data) {
                            let value: ImageServiceCompletion = (image, url.absoluteString)
                            completion(value)
                        } else {
                            failedCompletion(url: url, completion: completion)
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                        failedCompletion(url: url, completion: completion)
                    }
                })
            }
        }
    }
}

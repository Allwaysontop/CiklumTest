//
//  CountriesFeedMaintanceImpl.swift
//  CiklumTest
//
//  Created by Kramarchuk Kyrylo on 9/15/19.
//  Copyright © 2019 Kramarchuk Kyrylo. All rights reserved.
//

import Foundation
import UIKit

class CountriesFeedMaintanceImpl: NSObject, CountriesFeedMaintanceType {
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.registerNib(for: CountriesFeedCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    weak var initialView: UIView!
    let manager: CountriesFeedManager
    weak var delegate: CountriesFeedMaintanceDelegate?
    
    init(initialView: UIView, manager: CountriesFeedManager, delegate: CountriesFeedMaintanceDelegate?) {
        self.initialView = initialView
        self.manager = manager
        self.delegate = delegate
        
        super.init()
        
        initialSetup()
    }
    
    func loadData() {
        manager.loadCountries { countries, error in
            DispatchQueue.main.async { [weak self] in
                self?.reloadData()
            }
        }
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    // MARK: - Private
    
    private func initialSetup() {
        collectionView.add(into: initialView)
    }
}

// MARK: - UICollectionViewDelegate

extension CountriesFeedMaintanceImpl: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = manager.dataSourceItems[indexPath.row]
        delegate?.countriesFeedMaintanceDidSelect(item: item)
    }
}

// MARK: - UICollectionViewDataSource

extension CountriesFeedMaintanceImpl: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return manager.dataSourceItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = manager.dataSourceItems[indexPath.row]
        let cell = collectionView.dequeueReusableItem(of: CountriesFeedCell.self, for: indexPath)
        cell.configure(model: item)
        return cell
    }
}

extension CountriesFeedMaintanceImpl: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let item = manager.dataSourceItems[indexPath.row]
        let width = collectionView.bounds.width
        let height = CountriesFeedCell.height(boundingIn: width, item: item)
        return CGSize(width: width, height: height)
    }
}


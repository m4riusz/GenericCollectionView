//
//  CollectionViewDataSource.swift
//  GenericCollectionView
//
//  Created by Mariusz Sut on 09/12/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import UIKit


protocol UpdatableCell {
    associatedtype AssociatedType
    func updateForViewFor(item: AssociatedType)
}

protocol SectionCellConfigurator {
    static var reuseId: String { get }
    func configure(cell: UIView, index: Int)
    func numberOfItems()-> Int
    func onItemClick(indexPath: IndexPath)
    func getCellSize()-> CGSize
}

typealias OnItemClick<T> = (_ item: T, _ indexPath: IndexPath)-> Void

struct SectionCollectionCell<T: UpdatableCell, Item>: SectionCellConfigurator where T.AssociatedType == Item, T: UICollectionViewCell {
    static var reuseId: String { return T.reusableIdentifier() }
    fileprivate let size: CGSize
    fileprivate let items: [Item]
    fileprivate let didClickOnItem: OnItemClick<Item>?
    
    init(items: [Item], size: CGSize, didClickOnItem: OnItemClick<Item>? = nil) {
        self.items = items
        self.didClickOnItem = didClickOnItem
        self.size = size
    }
    
    func configure(cell: UIView, index: Int) {
        (cell as! T).updateForViewFor(item: self.items[index])
    }
    
    func onItemClick(indexPath: IndexPath) {
         self.didClickOnItem?(self.items[indexPath.row], indexPath)
    }
    
    func numberOfItems() -> Int {
        return self.items.count
    }
    
    func getCellSize()-> CGSize {
        return self.size
    }
}

class CollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    fileprivate var sections: [SectionCellConfigurator] = []
    
    init(collectionView: UICollectionView, cells: [UICollectionViewCell.Type]) {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self
        cells.forEach { collectionView.register($0, forCellWithReuseIdentifier: $0.reusableIdentifier()) }
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
    }
    
    func setSections(_ sections: [SectionCellConfigurator]) {
        self.sections = sections
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sections[section].numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? HeaderView else {
            return UICollectionReusableView()
        }
        view.label.text = "HEADER: \(indexPath.section)"
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let configurator = self.sections[indexPath.section]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: type(of: configurator).reuseId, for: indexPath)
        configurator.configure(cell: cell, index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.sections[indexPath.section].onItemClick(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.sections[indexPath.section].getCellSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60)
    }
}


extension UICollectionViewCell {
    class func reusableIdentifier()-> String {
        return String(describing: self)
    }
}


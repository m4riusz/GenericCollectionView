//
//  ScrolableCell.swift
//  GenericCollectionView
//
//  Created by Mariusz Sut on 13/12/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import UIKit

class ScrolableCell: UICollectionViewCell {
    let collectionView : UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    fileprivate func setup() {
        self.collectionView.register(NumberCell.self, forCellWithReuseIdentifier: NumberCell.reusableIdentifier())
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.isScrollEnabled = true
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.collectionView.collectionViewLayout = layout
        self.collectionView.dataSource = self
        self.addSubview(self.collectionView)
        
        self.addConstraint(NSLayoutConstraint(item: self.collectionView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10))
        self.addConstraint(NSLayoutConstraint(item: self.collectionView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -10))
        self.addConstraint(NSLayoutConstraint(item: self.collectionView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10))
        self.addConstraint(NSLayoutConstraint(item: self.collectionView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -10))
    }
}

extension ScrolableCell: UpdatableCell {
    typealias AssociatedType = Int
    
    func updateForViewFor(item: Int) {
        
    }
}

extension ScrolableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberCell.reusableIdentifier(), for: indexPath) as! NumberCell
        cell.label.text = String(describing: indexPath.row)
        return cell
    }
}

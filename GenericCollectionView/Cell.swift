//
//  Cell.swift
//  GenericCollectionView
//
//  Created by Mariusz Sut on 09/12/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import UIKit

class StringCell: UICollectionViewCell {
    let label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
        self.backgroundColor = .white
    }
    
    fileprivate func setup() {
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.label.textAlignment = .center
        self.label.textColor = .blue
        self.label.numberOfLines = 0
        self.addSubview(self.label)
        
        self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10))
         self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -10))
         self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10))
         self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -10))
    }
}

extension StringCell: UpdatableCell {
    typealias AssociatedType = DataString
    
    func updateForViewFor(item: DataString) {
        self.label.text = item.text
    }
}

class DateCell: UICollectionViewCell {
    let label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = .white
        self.setup()
    }
    
    fileprivate func setup() {
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.textAlignment = .center
        self.label.textColor = .green
        self.addSubview(self.label)
        
        self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10))
        self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -10))
        self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10))
        self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -10))
    }
}

extension DateCell: UpdatableCell {
    typealias AssociatedType = DataDate
    
    func updateForViewFor(item: DataDate) {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd.MM.yyyy"
        self.label.text = dateFormatterPrint.string(from: item.date)
    }
}

class NumberCell: UICollectionViewCell {
    let label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
        self.backgroundColor = .white
    }
    
    fileprivate func setup() {
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        self.label.textAlignment = .center
        self.label.textColor = .red
        self.addSubview(self.label)
        
        self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10))
        self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -10))
        self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10))
        self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -10))
    }
}

extension NumberCell: UpdatableCell {
    typealias AssociatedType = DataNumber
    
    func updateForViewFor(item: DataNumber) {
        self.label.text = String(describing: item.number)
    }
}

class HeaderView : UICollectionReusableView {
    let label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        self.initialize()
    }
    
    fileprivate func initialize() {
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        self.label.textAlignment = .center
        self.label.textColor = .orange
        self.addSubview(self.label)
        self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10))
        self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -10))
        self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10))
        self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -10))
    }
}

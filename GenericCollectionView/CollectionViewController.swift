//
//  CollectionViewController.swift
//  GenericCollectionView
//
//  Created by Mariusz Sut on 09/12/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    var dataSource: CollectionViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = CollectionViewDataSource(collectionView: self.collectionView, cells: [StringCell.self, DateCell.self, NumberCell.self])
        let stringSection = SectionCollectionCell<StringCell, DataString>(items: Repository.stringItems, size: CGSize(width: 100, height: 100)) { item, intedPath in
            let alert = UIAlertController(title: "Item", message: item.text, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.navigationController?.present(alert, animated: true, completion: nil)
        }
        let dateSection = SectionCollectionCell<DateCell, DataDate>(items: Repository.dateItems, size: CGSize(width: 300, height: 50))
        let numberSection = SectionCollectionCell<NumberCell, DataNumber>(items: Repository.numberItems, size: CGSize(width: 70, height: 70))
        
        self.dataSource?.setSections([stringSection, dateSection, numberSection])
    }
}

class Repository {
    static var stringItems = [
        DataString(text: "A"),
        DataString(text: "B"),
        DataString(text: "C"),
        DataString(text: "D"),
        DataString(text: "E"),
        DataString(text: "F"),
        DataString(text: "G"),
        DataString(text: "H")
    ]
    
    static var dateItems = [
        DataDate(date: Date().addingTimeInterval(100000)),
        DataDate(date: Date().addingTimeInterval(200000)),
        DataDate(date: Date().addingTimeInterval(300000)),
        DataDate(date: Date().addingTimeInterval(400000)),
        DataDate(date: Date().addingTimeInterval(500000)),
        DataDate(date: Date().addingTimeInterval(600000))
    ]
    
    static var numberItems = [
        DataNumber(number: 1),
        DataNumber(number: 2),
        DataNumber(number: 3),
        DataNumber(number: 4),
        DataNumber(number: 5),
        DataNumber(number: 6),
        DataNumber(number: 7)
    ]
}

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
        self.dataSource = CollectionViewDataSource(collectionView: self.collectionView, cells: [StringCell.self, DateCell.self, NumberCell.self, ScrolableCell.self])
        let stringSection = SectionCollectionCell<StringCell, DataString>(items: Repository.stringItems, numberOfColumn: 2) { item, intedPath in
            let alert = UIAlertController(title: "Item", message: item.text, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.navigationController?.present(alert, animated: true, completion: nil)
        }
        let dateSection = SectionCollectionCell<DateCell, DataDate>(items: Repository.dateItems, numberOfColumn: 2)
        let numberSection = SectionCollectionCell<NumberCell, DataNumber>(items: Repository.numberItems, numberOfColumn: 3)
        let scrollSection = SectionCollectionCell<ScrolableCell, Int >(items: [1], numberOfColumn: 1)
        self.dataSource?.setSections([stringSection, dateSection, numberSection, scrollSection])
    }
}

class Repository {
    static var stringItems = [
        DataString(text: "Afasfasf af asfsaf asfas fasf as fasf asfa fas fasf"),
        DataString(text: "B asf afasfffasssssss"),
        DataString(text: "C asfasfas"),
        DataString(text: "Dasfasfasf safasfas"),
        DataString(text: "E"),
        DataString(text: "Ffsfasf asfasfasfsafasfasfasfassf"),
        DataString(text: "G"),
        DataString(text: "Hggagsa  aas s")
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

//
//  TableViewCell.swift
//  task3
//
//  Created by Ashvin Alva on 14/07/23.
//

import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var responseData: [Alrings]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionCell")

        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.responseData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        
        collectionCell.collectionViewElement.text = responseData?[indexPath.row].title
        
        let str = responseData?[indexPath.row].startDateTime!
        
        collectionCell.startDate.text = String((str?.prefix(9))!) as String

        //collectionCell.startDate.text = "Start Data"
        collectionCell.startTime.text = String(String((str?.suffix(16))!).prefix(8)) as String
        
        //print(responseData?[indexPath.row].title)
        
        collectionCell.layer.cornerRadius = 12
        
        return collectionCell
        
    }
    
}

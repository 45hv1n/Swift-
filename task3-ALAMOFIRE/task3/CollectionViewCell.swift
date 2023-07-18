//
//  CollectionViewCell.swift
//  task3
//
//  Created by Ashvin Alva on 16/07/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionViewElement: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var startTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionViewElement.numberOfLines = 3
    }
    
    public func configure(with modelText : String){
        self.collectionViewElement.text = modelText
    }

}

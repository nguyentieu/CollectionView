//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by Nguyen on 10/26/17.
//  Copyright © 2017 Nguyen. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var collectionImage: UIImageView!
    @IBOutlet weak var collectionNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configCell(_ name: String, index: Int) {
         collectionNameLabel.text = name
        if index % 2 == 0 {
            //contentView.backgroundColor = .blue
            collectionImage.image = #imageLiteral(resourceName: "chimcanhcut")
        } else {
            //contentView.backgroundColor = .red
            collectionImage.image = #imageLiteral(resourceName: "chimcanhcut2")
        }
    }
}


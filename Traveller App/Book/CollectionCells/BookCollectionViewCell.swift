//
//  BookCollectionViewCell.swift
//  Traveller App
//
//  Created by Luis Farré Castán on 3/2/21.
//  Copyright © 2021 Alexander Roca - Joan Esteban. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookLocation: UILabel!
    @IBOutlet weak var bookActivity: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    
    override func prepareForReuse() {
        bookImage.image = nil
        bookLocation.text = nil
        bookActivity.text = nil
    }
}

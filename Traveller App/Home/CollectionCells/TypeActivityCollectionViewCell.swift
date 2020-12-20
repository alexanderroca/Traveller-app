//
//  TypeActivityCollectionViewCell.swift
//  Traveller App
//
//  Created by Luis Farré Castán on 20/12/20.
//  Copyright © 2020 Alexander Roca - Joan Esteban. All rights reserved.
//

import UIKit

class TypeActivityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var typeActivityImage: UIImageView!
    @IBOutlet weak var typeActivity: UILabel!
    
    override func prepareForReuse() {
        typeActivityImage.image = nil
        typeActivity.text = nil
    }
    
}

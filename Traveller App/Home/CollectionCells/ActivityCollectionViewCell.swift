//
//  ActivityCollectionViewCell.swift
//  Traveller App
//
//  Created by Luis Farré Castán on 20/12/20.
//  Copyright © 2020 Alexander Roca - Joan Esteban. All rights reserved.
//

import UIKit

class ActivityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var activity: UILabel!
    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var location: UILabel!
    
    
    override func prepareForReuse() {
        activityImage.image = nil
        location.text = nil
        activity.text = nil
    }
    
}

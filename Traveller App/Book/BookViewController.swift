//
//  BookViewController.swift
//  Traveller App
//
//  Created by Luis Farré Castán on 3/2/21.
//  Copyright © 2021 Alexander Roca - Joan Esteban. All rights reserved.
//

import UIKit

class BookViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let experiences  = ["Forest Camping", "Fishing time"]
    let activityImages0: [UIImage] = [
        UIImage(named: "Card2")!,
        UIImage(named: "Card1")!,
        ]
    let locations0 = ["La Seu d'Urgell, Spain", "Alt Empordà, Spain"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return experiences.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BookCollectionViewCell
        
        cell.bookActivity.text = experiences[indexPath.item]
        cell.bookImage.image = activityImages0[indexPath.item]
        cell.bookLocation.text = locations0[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
}

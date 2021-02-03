//
//  HomeViewController.swift
//  Traveller App
//
//  Created by Luis Farré Castán on 20/12/20.
//  Copyright © 2020 Alexander Roca - Joan Esteban. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet weak var activitiesCollectionView: UICollectionView!
    
    let activities = ["Forest Camping", "Fishing time"]
    let activityImages: [UIImage] = [
        UIImage(named: "Card2")!,
        UIImage(named: "Card1")!,
    ]
    let locations = ["La Seu d'Urgell, Spain", "Alt Empordà, Spain"]
    
    let typeActivities = ["Hiking", "Ski", "Sky Diving", "Skateboard"]
    let typeActivityImages: [UIImage] = [
        UIImage(named: "mcard1")!,
        UIImage(named: "mcard2")!,
        UIImage(named: "mcard3")!,
        UIImage(named: "mcard4")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ActivityCollectionViewCell
        cell.activity.text = activities[indexPath.item]
        cell.activityImage.image = activityImages[indexPath.item]
        cell.location.text = locations[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.activitiesCollectionView{
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailedViewController") as? DetailedViewController
            
            vc?.name = activities[indexPath.row]
            vc?.image = activityImages[indexPath.row]
            vc?.location = locations[indexPath.row]
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}

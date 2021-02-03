//
//  HomeViewController.swift
//  Traveller App
//
//  Created by Luis Farré Castán on 20/12/20.
//  Copyright © 2020 Alexander Roca - Joan Esteban. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet weak var activityType: UISegmentedControl!
    
    @IBOutlet weak var activitiesCollectionView: UICollectionView!
    
    let experiences  = ["Forest Camping", "Fishing time"]
    var adventures = ["Forest Camping"]
    var activities = ["Fishing time"]
    
    let activityImages0: [UIImage] = [
        UIImage(named: "Card2")!,
        UIImage(named: "Card1")!,
    ]
    
    let activityImages1: [UIImage] = [
        UIImage(named: "Card2")!
    ]
    
    let activityImages2: [UIImage] = [
        UIImage(named: "Card1")!
    ]
    
    let locations0 = ["La Seu d'Urgell, Spain", "Alt Empordà, Spain"]
    let locations1 = ["La Seu d'Urgell, Spain"]
    let locations2 = ["Alt Empordà, Spain"]
    
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

    
    @IBAction func segmentedSelected(_ sender: Any) {
        activitiesCollectionView.reloadData()
        activitiesCollectionView.reloadItems(at: activitiesCollectionView.indexPathsForVisibleItems)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch activityType.selectedSegmentIndex {
            case 0: return experiences.count
            case 1: return adventures.count
            case 2: return activities.count
            default: return 0
        }   //switch

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ActivityCollectionViewCell
        
        switch activityType.selectedSegmentIndex {
            case 0:
                cell.activity.text = experiences[indexPath.item]
                cell.activityImage.image = activityImages0[indexPath.item]
                cell.location.text = locations0[indexPath.item]
                break
            case 1:
                cell.activity.text = adventures[indexPath.item]
                cell.activityImage.image = activityImages1[indexPath.item]
                cell.location.text = locations1[indexPath.item]
                break
            case 2:
                cell.activity.text = activities[indexPath.item]
                cell.activityImage.image = activityImages2[indexPath.item]
                cell.location.text = locations2[indexPath.item]
                break
            default: break
        }   //switch
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.activitiesCollectionView{
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailedViewController") as? DetailedViewController
            
            switch activityType.selectedSegmentIndex {
                case 0:
                    vc?.name = experiences[indexPath.row]
                    vc?.image = activityImages0[indexPath.row]
                    vc?.location = locations0[indexPath.row]
                    break
                case 1:
                    vc?.name = adventures[indexPath.row]
                    vc?.image = activityImages1[indexPath.row]
                    vc?.location = locations1[indexPath.row]
                case 2:
                    vc?.name = activities[indexPath.row]
                    vc?.image = activityImages2[indexPath.row]
                    vc?.location = locations2[indexPath.row]
                default: break
            }   //switch
            
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}

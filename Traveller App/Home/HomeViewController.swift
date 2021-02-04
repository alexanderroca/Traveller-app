//
//  HomeViewController.swift
//  Traveller App
//
//  Created by Luis Farré Castán on 20/12/20.
//  Copyright © 2020 Alexander Roca - Joan Esteban. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet weak var activityType: UISegmentedControl!
    
    @IBOutlet weak var activitiesCollectionView: UICollectionView!
   
    //TODO: replace this code for an array of structs
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
    // ENDs here
    
    //TODO: to be debugged
    struct Event {
        var name: String
        var eventImage: UIImage
        var location: String
        var category: String
        var eventID: String
    }
    
    var _experiences: [Event] = []
    var _adventures: [Event] = []
    var _activities: [Event] = []
    
    func initStructs(){
        
        //Per afegir un element al array de struct ->
        //var aux: Event = Event(name: "Rascarme el cul", eventImage: nil, location: "Els meus ous") Aquesta linia peta per el nil
        //_experiences.append(aux)
        //ENDs here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getExperiences()
        //activitiesCollectionView.reloadData()
        
    }

    
    @IBAction func segmentedSelected(_ sender: Any) {
        activitiesCollectionView.reloadData()
        activitiesCollectionView.reloadItems(at: activitiesCollectionView.indexPathsForVisibleItems)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        switch activityType.selectedSegmentIndex {
            case 0: return _experiences.count
                    //TODO: to be debugged
                    
                    //ENDs here
            case 1: return _adventures.count
                    //TODO: to be debugged
                    //
                    //ENDs here
            case 2: return _activities.count
                    //TODO: to be debugged
                    //
                    //ENDs here
            default: return 0
        }   //switch

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ActivityCollectionViewCell
        
        switch activityType.selectedSegmentIndex {
            case 0:
                /*
                cell.activity.text = experiences[indexPath.item]
                cell.activityImage.image = activityImages0[indexPath.item]
                cell.location.text = locations0[indexPath.item]
                */
                
                cell.activity.text = _experiences[indexPath.item].name
                cell.activityImage.image = _experiences[indexPath.item].eventImage
                cell.location.text = _experiences[indexPath.item].location
                //ENDs here
                break
            case 1:
                
                /*
                cell.activity.text = adventures[indexPath.item]
                cell.activityImage.image = activityImages1[indexPath.item]
                cell.location.text = locations1[indexPath.item]
                */
                
                //TODO: to be debugged
                cell.activity.text = _adventures[indexPath.item].name
                cell.activityImage.image = _adventures[indexPath.item].eventImage
                cell.location.text = _adventures[indexPath.item].location
                //ENDs here
                break
            case 2:
                
                /*
                cell.activity.text = activities[indexPath.item]
                cell.activityImage.image = activityImages2[indexPath.item]
                cell.location.text = locations2[indexPath.item]
                */
                
                //TODO: to be debugged
                cell.activity.text = _activities[indexPath.item].name
                cell.activityImage.image = _activities[indexPath.item].eventImage
                cell.location.text = _activities[indexPath.item].location
                //ENDs here
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
                    
                    /*
                    vc?.name = experiences[indexPath.row]
                    vc?.image = activityImages0[indexPath.row]
                    vc?.location = locations0[indexPath.row]
                    */
 
                    //TODO: to be debugged
                    vc?.name = _experiences[indexPath.row].name
                    vc?.image = _experiences[indexPath.row].eventImage
                    vc?.location = _experiences[indexPath.row].location
                    //ENDs here
                    break
                case 1:
                    
                    /*
                    vc?.name = adventures[indexPath.row]
                    vc?.image = activityImages1[indexPath.row]
                    vc?.location = locations1[indexPath.row]
                    */
 
                    //TODO: to be debugged
                    vc?.name = _adventures[indexPath.row].name
                    vc?.image = _adventures[indexPath.row].eventImage
                    vc?.location = _adventures[indexPath.row].location
                    //ENDs here
                case 2:
                    
                    /*
                    vc?.name = activities[indexPath.row]
                    vc?.image = activityImages2[indexPath.row]
                    vc?.location = locations2[indexPath.row]
                    */
                    
                    //TODO: to be debugged
                    vc?.name = _activities[indexPath.row].name
                    vc?.image = _activities[indexPath.row].eventImage
                    vc?.location = _activities[indexPath.row].location
                    //ENDs here
                default: break
            }   //switch
            
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    
    
    //All of them
    func getExperiences(){
        
        let db = Firestore.firestore()
        
        db.collection("experiences")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    for document in querySnapshot!.documents {
                        
                        print("\(document.documentID) => \(document.data())")
                        
                        let data = document.data()
                        
                        let name = data["name"] as! String
                        let location = data["location"] as! String
                        let category = data["category"] as! String
                        let imageString = data["image"] as! String
                        
                        let eventID = document.documentID
                        
                        
                        //generate image
                        var image2 = UIImage(named: "default-experience")
                        
                        
                         do{
                            
                            let imageUrl = URL(string: imageString)
                            
                            if imageUrl != nil {
                                let imageData = try Data(contentsOf: imageUrl!)
                                image2 = UIImage(data: imageData)
                            }else{
                                image2 = UIImage(named: "default-experience")
                            }
                            
                             
                         }catch{
                             //Use default image
                            image2 = UIImage(named: "default-experience")
                            
                         }
                        
                        let event = Event(name: name, eventImage: image2!, location: location, category: category, eventID: eventID)
                        
                        
                        switch category {
                        
                            case "activity":
                                //add to activity array
                                self._activities.append(event)
                                //Add to experiences array
                                self._experiences.append(event)
                                
                                break
                                
                            case "adventure":
                                //add to adventures array
                                self._adventures.append(event)
                                //Add to experiences array
                                self._experiences.append(event)
                                break
                            
                            default:
                                print("ERROR: UNDEFINED category")
                            }
                        
                    }
                    
                }
                
                
        }
        
        
    }
    
}

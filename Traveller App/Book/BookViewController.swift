//
//  BookViewController.swift
//  Traveller App
//
//  Created by Luis Farré Castán on 3/2/21.
//  Copyright © 2021 Alexander Roca - Joan Esteban. All rights reserved.
//

import UIKit
import Firebase

class BookViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //TODO: to be debugged
    struct BookedEvent {
        var name: String
        var eventImage: UIImage
        var location: String
        var experienceID: String
    }
    
    let experiences  = ["Forest Camping", "Fishing time"]
    let activityImages0: [UIImage] = [
        UIImage(named: "Card2")!,
        UIImage(named: "Card1")!,
        ]
    let locations0 = ["La Seu d'Urgell, Spain", "Alt Empordà, Spain"]
    
    
    var _experiences: [BookedEvent] = []
    
    
    
    override func viewDidLoad() {
        getData()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return _experiences.count
    }
    
    func getData(){
        
        let db = Firestore.firestore()
        
        let userUID = Auth.auth().currentUser?.uid
        
        db.collection("users").document(userUID!).collection("booked").getDocuments(){ (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                
                print("Booked experiences retrieved correctly")
                
                //Generate arrays
                for document in querySnapshot!.documents {
                
                    let data = document.data()
                    
                    let root = data["root"] as! Bool
                    
                    if(root == false){
                        
                        let name = data["name"] as! String
                        let location = data["location"] as! String
                        let participants = data["participants"] as! Int
                        let imageString = data["image"] as! String
                        let experienceID = document.documentID
                        
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
                        
                        self._experiences.append(BookedEvent(name: name, eventImage: image2!, location: location, experienceID: experienceID))
                    }
                    
                }
                
                self.collectionView.reloadData()
                
            }
            
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BookCollectionViewCell
        
            /*
        cell.bookActivity.text = experiences[indexPath.item]
        cell.bookImage.image = activityImages0[indexPath.item]
        cell.bookLocation.text = locations0[indexPath.item]
        */
        
        //NEW
        
        cell.bookActivity.text = _experiences[indexPath.item].name
        cell.bookLocation.text = _experiences[indexPath.item].location
        cell.bookImage.image = _experiences[indexPath.item].eventImage
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    
}

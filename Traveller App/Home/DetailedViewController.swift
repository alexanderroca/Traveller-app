//
//  DetailedViewController.swift
//  Traveller App
//
//  Created by Luis Farré Castán on 20/12/20.
//  Copyright © 2020 Alexander Roca - Joan Esteban. All rights reserved.
//

import UIKit
import Firebase

class DetailedViewController: UIViewController {

    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var activityName: UILabel!
    @IBOutlet weak var activityPrice: UILabel!
    @IBOutlet weak var numberOfPeople: UISegmentedControl!
    @IBOutlet weak var activityDescription: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var bookButton: UIButton!
    @IBOutlet weak var activityLocation: UILabel!
    
    var name = ""
    var image: UIImage? = nil
    var location = ""
    var experienceID = ""
    var imageString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityName.text = name
        activityImage.image = image
        activityLocation.text = location
        
    }
    

    @IBAction func ButtonPressed(_ sender: Any) {
        
        let db = Firestore.firestore()
        
        let userUID = Auth.auth().currentUser?.uid
        
        db.collection("users").document(userUID!).collection("booked").document(self.experienceID).setData([
            "name": name,
            "image": imageString,
            "participants": numberOfPeople.selectedSegmentIndex + 1,
            "location": location,
            "root": false
            
        ]) { err in
            if let err = err {
                print("Error, couldn't add user: \(err)")
            } else {
                print("Experience booked!")
                
            }
            
        }
        
        
    }
}

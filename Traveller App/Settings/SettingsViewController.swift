//
//  SettingsViewController.swift
//  Traveller App
//
//  Created by Luis Farré Castán on 19/12/20.
//  Copyright © 2020 Alexander Roca - Joan Esteban. All rights reserved.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var _userImage: UIImageView!
    @IBOutlet weak var _name: UILabel!
    @IBOutlet weak var _username: UILabel!
    @IBOutlet weak var _dateOfBirth: UILabel!
    @IBOutlet weak var _phone: UILabel!
    @IBOutlet weak var _email: UILabel!
    @IBOutlet weak var _country: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getInfoFromFirestore()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setUserInfo(userImage:String, name:String, phone:String, email:String, country:String, dateOfBirth:
                        String){
        
        //self._userImage.image = userImage
        self._name.text = name
        self._dateOfBirth.text = dateOfBirth
        self._phone.text = phone
        self._email.text = email
        self._country.text = country
        
        let imageUrlString = userImage

        let imageUrl = URL(string: imageUrlString)!

        let imageData = try! Data(contentsOf: imageUrl)

        let image = UIImage(data: imageData)
        self._userImage.image = image!
        
        
    }
    
    
    func getInfoFromFirestore(){
        
        let db = Firestore.firestore()
        let userID = Auth.auth().currentUser!.uid
        
        let docRef = db.collection("users").document(userID)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                let data = document.data()
                
                let name = data?["name"] as? String
                let email = data?["email"] as? String
                let image = data?["image"] as? String
                let country = data?["country"] as? String
                let phone = data?["phone"] as? String
                let dateOfBirth = data?["birthDate"] as? String
                
                self.setUserInfo(userImage: image!, name: name!, phone: phone!, email: email!, country: country!, dateOfBirth: dateOfBirth!)
                
                
            } else {
                print("Document does not exist")
            }
        
        }
        
    }
    

}

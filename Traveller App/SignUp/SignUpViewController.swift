//
//  SignUpViewController.swift
//  Traveller App
//
//  Created by Luis Farré Castán on 3/2/21.
//  Copyright © 2021 Alexander Roca - Joan Esteban. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var _username: UITextField!
    @IBOutlet weak var _password: UITextField!
    @IBOutlet weak var _passwordVerification: UITextField!
    @IBOutlet weak var _phone: UITextField!
    @IBOutlet weak var _email: UITextField!
    @IBOutlet weak var _country: UITextField!
    @IBOutlet weak var _dateOfBirth: UITextField!
    
    var rootExperience = "i3Du6GMMtBX6Thm2In5D"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func ifSignUpPressed(_ sender: Any) {
        
        checkData()
        
        
    }
    
    func checkData(){
        
        if _password.text?.isEmpty == true {
            //Error, password cant be empty
            return
        }
        
        if _passwordVerification.text != _password.text {
            //Error passwords must match
            return
        }
        
        if _phone.text?.isEmpty == true{
            //Error phone cant be empty
            return
        }
        
        if _email.text?.isEmpty == true {
            //Error, phone can't be empty
            return
        }
        
        if _country.text?.isEmpty == true {
            //Error, country cant be empty
            return
            
        }
        
        if _dateOfBirth.text?.isEmpty == true {
            //Error, birthdate cant be empty
            return
        }
        
        if _username.text?.isEmpty == true {
            //Error, name can't be empty
            return
            
        }
        
        signUp()
        
        
    }
    
    
    func signUp(){
        
        let email = _email.text
        let password = _password.text
        
        
        Auth.auth().createUser(withEmail: email!, password: password!) { (result, error) in
            
            if let result = result, error == nil{
                
                self.addUserInfo(email: email!, password: password!)
                
            }
            
        }
        
    }
    
    func addUserInfo(email: String, password: String){
        
        
        let userUID = Auth.auth().currentUser?.uid
        let db = Firestore.firestore()
        
        let name = _username.text
        let phone = _phone.text
        let country = _country.text
        let dateOfBirth = _dateOfBirth.text
        
        
        db.collection("users").document(userUID!).setData([
            "name": name,
            "country": country,
            "phone": phone,
            "image": "none",
            "email": email,
            "birthDate": dateOfBirth
            
        ]) { err in
            if let err = err {
                print("Error, couldn't add user: \(err)")
            } else {
                
                db.collection("users").document(userUID!).collection("booked").document(self.rootExperience).setData([
                "root": true])
                {err in
                    
                    if let err = err{
                        print("Error, couldn't create booked for user")
                    }else{
                        print("User added successfully")
                        //TODO: Redirect to login page---------------------------------------------------------------------------
                    }
                    
                }
                
            }
            
        }
        
    }
    
}

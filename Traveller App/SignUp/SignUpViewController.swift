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
            let alert = UIAlertController(title: "Incorrect info", message: "Pasasword cant be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if _passwordVerification.text != _password.text {
            //Error passwords must match
            let alert = UIAlertController(title: "Incorrect info", message: "passwords must match", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if _phone.text?.isEmpty == true{
            //Error phone cant be empty
            let alert = UIAlertController(title: "Incorrect info", message: "Phone cant be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if _email.text?.isEmpty == true {
            //Error, phone can't be empty
            let alert = UIAlertController(title: "Incorrect info", message: "email cant be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if _country.text?.isEmpty == true {
            //Error, country cant be empty
            let alert = UIAlertController(title: "Incorrect info", message: "country cant be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
            
        }
        
        if _dateOfBirth.text?.isEmpty == true {
            //Error, birthdate cant be empty
            let alert = UIAlertController(title: "Incorrect info", message: "birthdate cant be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if _username.text?.isEmpty == true {
            //Error, name can't be empty
            let alert = UIAlertController(title: "Incorrect info", message: "name cant be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
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
            "image": "https://i.pinimg.com/originals/3d/09/d2/3d09d260e77e9db5a52c54e15d2d0294.jpg",
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
                        let alert = UIAlertController(title: "Something went wrong...", message: "Couldnt connect with database", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }else{
                        print("User added successfully")
                        let alert = UIAlertController(title: "User created!", message: "", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        //TODO: Redirect to login page---------------------------------------------------------------------------
                    }
                    
                }
                
            }
            
        }
        
    }
    
}

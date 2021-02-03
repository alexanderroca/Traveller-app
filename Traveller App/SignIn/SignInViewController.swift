//
//  SignInViewController.swift
//  Traveller App
//
//  Created by Luis Farré Castán on 3/2/21.
//  Copyright © 2021 Alexander Roca - Joan Esteban. All rights reserved.
//

import UIKit
import Firebase


class SignInViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func ifPressed(_ sender: Any) {
        
        if (username.text?.isEmpty == true){
            print("No text in username")
            return
        }
        
        if (password.text?.isEmpty == true){
            print("No text in password")
            return
        }
        
        login()
        
    }
    
    func login(){
        
        Auth.auth().signIn(withEmail: username.text!, password: password.text!) { [weak self] authResult, err in
            
            guard let strongSelf = self else {return}
            if let err = err{
                print(err.localizedDescription)
            }else{
                self!.checkUserInfo()
            }
            
        }
        
    }
    
    func checkUserInfo(){
        
        if Auth.auth().currentUser != nil{
            print(Auth.auth().currentUser?.uid)
            //Chnage screen to home
            performSegue(withIdentifier: "home", sender: self)
        }
        
    }
    
}

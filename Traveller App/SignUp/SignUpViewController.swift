//
//  SignUpViewController.swift
//  Traveller App
//
//  Created by Luis Farré Castán on 3/2/21.
//  Copyright © 2021 Alexander Roca - Joan Esteban. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var _username: UITextField!
    @IBOutlet weak var _password: UITextField!
    @IBOutlet weak var _passwordVerification: UITextField!
    @IBOutlet weak var _phone: UITextField!
    @IBOutlet weak var _email: UITextField!
    @IBOutlet weak var _country: UITextField!
    @IBOutlet weak var _dateOfBirth: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func ifSignUpPressed(_ sender: Any) {
    }
    
}

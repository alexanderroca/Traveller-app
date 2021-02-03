//
//  SignInViewController.swift
//  Traveller App
//
//  Created by Luis Farré Castán on 4/2/21.
//  Copyright © 2021 Alexander Roca - Joan Esteban. All rights reserved.
//

import UIKit

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
    }
    
}

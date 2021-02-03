//
//  SettingsViewController.swift
//  Traveller App
//
//  Created by Luis Farré Castán on 19/12/20.
//  Copyright © 2020 Alexander Roca - Joan Esteban. All rights reserved.
//

import UIKit

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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setUserInfo(userImage:UIImage, name:String, username:String, dateOfBirth:String, phone:String, email:String, country:String){
        
        self._userImage.image = userImage
        self._name.text = name
        self._username.text = username
        self._dateOfBirth.text = dateOfBirth
        self._phone.text = phone
        self._email.text = email
        self._country.text = country
    }

}

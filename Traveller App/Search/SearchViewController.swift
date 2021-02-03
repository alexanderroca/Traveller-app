//
//  SearchViewController.swift
//  Traveller App
//
//  Created by Luis Farré Castán on 19/12/20.
//  Copyright © 2020 Alexander Roca - Joan Esteban. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var elementToSearch: UISearchBar!
    
    let activities = ["Forest Camping", "Fishing time"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

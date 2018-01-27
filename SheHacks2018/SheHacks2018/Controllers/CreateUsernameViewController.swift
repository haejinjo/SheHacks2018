//
//  CreateUsernameViewController.swift
//  SheHacks2018
//
//  Created by Haejin Jo on 1/27/18.
//  Copyright © 2018 Haejin Jo. All rights reserved.
//

import Foundation
import UIKit

class CreateUsernameViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.usernameTextField.delegate = self
    }
    @IBAction func usernameTextFieldPrimaryActionTriggered(_ sender: Any) {
        print("primary action triggered")
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "mainButtonsViewController")
        self.present(initialViewController, animated: true, completion: nil)
    }
    

    
    //CoreLocation
    // Static Maps API: given a center point, give me the area around that center
    // show the image around the users current location you gto from CoreLocation
    
    // Geocoding API: take user input (nonuniform text blob) do its best to return to you a latitutd eand longitude
    // use for pins
    
}

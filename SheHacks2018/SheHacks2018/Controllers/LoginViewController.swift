//
//  LoginViewController.swift
//  SheHacks2018
//
//  Created by Haejin Jo on 1/27/18.
//  Copyright © 2018 Haejin Jo. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase


class LoginViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func loginButtonTapped(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier else {return }
        
        if identifier == "toCreateUsername" {
            print("Transitioning to create username VC")
        }
    }

}



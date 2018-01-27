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
        print("login butotn tapped")
        let user = Auth.auth().currentUser
        // if user exists
        if user != nil { print("Yay user already is here") }
        else { // sign them in
            Auth.auth().signInAnonymously()
                {
                    (user, error) in
                    if error != nil
                    {
                        print("Oh no!!! Error with anon authentication")
                        return
                    }
            print("Yay user #\(user!.uid) signed in anonymously!!!")
            } // end of closure
            return
        } // end of guard
    } //end of func
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 6 // make button rounded
        
        // TO DO if user exists, skip to mainButtonVC NOT createUsernameVC
    }
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier else {return }
        
        if identifier == "toCreateUsername" {
            print("Transitioning to create username VC")
        }
    }

}



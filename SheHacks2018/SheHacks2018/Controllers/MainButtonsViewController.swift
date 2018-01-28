//
//  MainButtonsViewController.swift
//  SheHacks2018
//
//  Created by Haejin Jo on 1/27/18.
//  Copyright © 2018 Haejin Jo. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth


class MainButtonsViewController: UIViewController {
    @IBOutlet weak var toMapButton: UIButton!
    @IBOutlet weak var makeSuggestionButton: UIButton!
    @IBAction func unwindToMainButtonsViewController(segue:UIStoryboardSegue) {}
    @IBAction func toMapButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toMapViewController", sender: self)
    }
    
    @IBAction func makeSuggestionButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toInputViewController", sender: self)
    }
    
    @IBOutlet weak var accountButton: UIButton!
    
    @IBAction func accountButtonTapped(_ sender: Any) {
        
       try! Auth.auth().signOut()
        let storyboard = UIStoryboard(name: "Login", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "loginViewController")
        self.show(vc, sender: self)
        print("user signed out :)" )
    }
    
}



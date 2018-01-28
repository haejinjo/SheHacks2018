//
//  InputViewController.swift
//  SheHacks2018
//
//  Created by Haejin Jo on 1/27/18.
//  Copyright © 2018 Haejin Jo. All rights reserved.
//

import Foundation
import UIKit

class InputViewController: UIViewController {
    @IBOutlet weak var submitNoteButton: UIButton!
    @IBAction func submitNoteButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "noteTextFieldPrimaryActionTriggered", sender: self.submitNoteButton)
    }
    
    @IBAction func noteTextFieldPrimaryActionTriggered(_ sender: Any) {
        print("primary action triggered")
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "mainButtonsViewController")
        self.present(initialViewController, animated: true, completion: nil)
    }
    
}

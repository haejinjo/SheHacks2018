//
//  InputViewController.swift
//  SheHacks2018
//
//  Created by Haejin Jo on 1/27/18.
//  Copyright © 2018 Haejin Jo. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

protocol currLocationKeeper: class {
    var submittedNoteHere: CLLocationCoordinate2D? { get set }
}


class InputViewController: UIViewController, CLLocationManagerDelegate, currLocationKeeper {
    var submittedNoteHere: CLLocationCoordinate2D?

    @IBOutlet weak var noteTextField: UITextView!
    @IBOutlet weak var submitNoteButton: UIButton!
    @IBAction func submitNoteButtonTapped(_ sender: UIButton) {
        print("HEY! coordinates here are......\(String(describing: submittedNoteHere))")
        coordinates.append(submittedNoteHere)
     
        
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "noteTextFieldPrimaryActionTriggered", sender: self.dismissButton)
    }
    @IBOutlet weak var dismissButton: UIButton!
//    let bottom = NSMakeRange(noteTextField.text.count-1, 1)
//    self.noteTextField.scrollRangeToVisible(bottom)
//
//
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
       super.viewDidLoad()
        noteTextField.becomeFirstResponder()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    @IBAction func noteTextFieldPrimaryActionTriggered(_ sender: Any) {
        print("primary action triggered")
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "mainButtonsViewController")
        self.present(initialViewController, animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        submittedNoteHere =  (manager.location?.coordinate)!
        coordinates.append(submittedNoteHere!)
    }

}


//
//  MapViewController.swift
//  SheHacks2018
//
//  Created by Haejin Jo on 1/27/18.
//  Copyright © 2018 Haejin Jo. All rights reserved.
//

import UIKit
import Foundation
import MapKit //APple-provided native map API, no mo' 3rd party SDKs
import CoreLocation



class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    let  locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    
    @objc func addAnnotationOnLongPress(_ gesture:UILongPressGestureRecognizer)
    {
        if gesture.state == .ended {
            let point = gesture.location(in: self.mapView)
            let coordinate = self.mapView.convert(point, toCoordinateFrom: self.mapView)
            print("the coordinate is.....*drum roll*...\(coordinate)")
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = "Title"
            annotation.subtitle = "Subtitle"
            self.mapView.addAnnotation(annotation)
        }
    } // action function end
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotationOnLongPress(_:)))
        
        longPressGesture.minimumPressDuration = 1.0
        
        self.mapView.addGestureRecognizer(longPressGesture)
    }

}

extension MapViewController {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.05, 0.05)
            
            // define a map region = map center (location[0] coord) + zoom level (arbitrary span)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("locaiton error: \(error)")
    }
}



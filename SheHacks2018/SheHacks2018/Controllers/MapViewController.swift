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

// you need to share your location with us if you want to...
// 1) quickly find sanctuary near you when you're in distress
// 2) be able to share your thoughts at the places you are to when you find peace

var coordinates: [CLLocationCoordinate2D?] = [CLLocationCoordinate2D]()

class MapViewController: UIViewController, CLLocationManagerDelegate, currLocationKeeper, UITextViewDelegate  {
    
    var submittedNoteHere: CLLocationCoordinate2D?

    let  locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    
//    @objc func addAnnotationOnLongPress(_ gesture:UILongPressGestureRecognizer)
//    {
//        if gesture.state == .ended {
//            let point = gesture.location(in: self.mapView)
//            let coordinate = self.mapView.convert(point, toCoordinateFrom: self.mapView)
//            print("the coordinate is.....*drum roll*...\(coordinate)")
//            let annotation = MKPointAnnotation()
//            annotation.coordinate = coordinate
//            annotation.title = "Title"
//            annotation.subtitle = "Subtitle"
//            self.mapView.addAnnotation(annotation)
//        }
//    } // action function end
    

    let textBox = UITextView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.delegate = self
        textBox.delegate = self
        
        // ADD PINS TO MAP
        
        //enter when array has changed
                for (index, coordinate) in coordinates.enumerated() {
                    let anno = MKPointAnnotation()
                    anno.coordinate = coordinate!
                    mapView.addAnnotation(anno)
                    
                    var location: Location 
                    print("ADDRESS #\(index) is \(String(describing: coordinate))")
                }
        }
    
    

//        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotationOnLongPress(_:)))
//
//        longPressGesture.minimumPressDuration = 1.0
//
//        self.mapView.addGestureRecognizer(longPressGesture)
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

extension MapViewController: MKMapViewDelegate {
    
//    // gets called for every annotaitno addded to map to return the view for each annotation
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        guard let annotation = annotation as? customCalloutView else {return nil}
//
//        let identifier = "marker"
//        var view: MKMarkerAnnotationView
//
//        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
//            dequeuedView.annotation = annotation
//            view = dequeuedView
//        } else {
//            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            view.canShowCallout = true
//            view.calloutOffset = CGPoint(x: -5, y: 5)
//            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//        }
//        return view
    
    
//    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let identifier = "MyCustomAnnotation"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        
        configureDetailView(annotationView: annotationView!)
        
        return annotationView
    }

    func configureDetailView(annotationView: MKAnnotationView) {
        
        textBox.frame.size.height = 200
        textBox.frame.size.width = 300
        
        let views = ["snapshotView": textBox]
        textBox.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[snapshotView(300)]", options: [], metrics: nil, views: views))
        textBox.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[snapshotView(200)]", options: [], metrics: nil, views: views))
        
        textBox.insertText("Hi out there. I hope you can hear me. I want you to know that I was here. And I existed.")

        let options = MKMapSnapshotOptions()
//        options.size = CGSize(width: width, height: height)
//        options.mapType = .satelliteFlyover
//        options.camera = MKMapCamera(lookingAtCenter: annotationView.annotation!.coordinate, fromDistance: 250, pitch: 65, heading: 0)
//
        
        
//        let snapshotter = MKMapSnapshotter(options: options)
//        snapshotter.start { snapshot, error in
//            if snapshot != nil {
//                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
//                imageView.image = snapshot!.image
//                snapshotView.addSubview(imageView)
//            }
//        }
        
        annotationView.detailCalloutAccessoryView = textBox
    }
}



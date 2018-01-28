//
//  customCalloutView.swift
//  SheHacks2018
//
//  Created by Haejin Jo on 1/28/18.
//  Copyright © 2018 Haejin Jo. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class Artwork: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        
        super.init()
    }
    
    
}

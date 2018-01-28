//
//  PlaceService.swift
//  SheHacks2018
//
//  Created by Haejin Jo on 1/27/18.
//  Copyright © 2018 Haejin Jo. All rights reserved.
//

import Foundation
import FirebaseDatabase
import CoreLocation

struct LocationService {
    
    static let ref = Database.database().reference()
    static let locationsRef = ref.child("locations") // creates new child-of-root node for locations
    
    var locationArray = [Location]()
    
    static func create(location: Location) -> Location {
        let locationRef = locationsRef.childByAutoId() // create new unique location ID node
        let dict = location.getDict()
        locationRef.setValue(dict) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
            }
        }
        
        location.lid = locationRef.key
        
        return location
    }
    
    
    static func retrieve(completion: @escaping([Location]) -> Void) {
        
        var locationArray = [Location]()
        let locationsRef = Database.database().reference().child("locations")
        
        locationsRef.observe(DataEventType.value, with: { (snapshot) in
            for locationSnapshot in snapshot.children {
                if let location = Location(snapshot: locationSnapshot as! DataSnapshot) {
                locationArray.append(location)
                    
                }
            }
        completion(locationArray)
        })
    }
}


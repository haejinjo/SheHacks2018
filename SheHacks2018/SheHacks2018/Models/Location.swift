//
//  Place.swift
//  SheHacks2018
//
//  Created by Admin on 1/26/18.
//  Copyright © 2018 Haejin Jo. All rights reserved.
//

import Foundation
import MapKit
import FirebaseDatabase

class Location {
    var coordinate: CLLocationCoordinate2D
    var lid: String?
    var notesArray: [Note]
    
    init(coordinate: CLLocationCoordinate2D, notes: [Note]) {
        self.coordinate = coordinate
        self.notesArray = notes
    }
    
    func addNote(note: Note) {
        self.notesArray.append(note)
    }
    
    func getDict() -> [String:Any] {
        var locationDict = [String:Any]()
        locationDict["coordinates"] = self.coordinate
        locationDict["notesArray"] = self.notesArray
        
        return locationDict
    }
    
    init? (snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String: Any],
            let coordinate = dict["coordinate"] as? CLLocationCoordinate2D,
            let notesArray = dict["notesArray"] as? [Note]
            else { return nil }
        self.lid = snapshot.key
        self.coordinate = coordinate
        self.notesArray = notesArray
    }
    
    
    
}

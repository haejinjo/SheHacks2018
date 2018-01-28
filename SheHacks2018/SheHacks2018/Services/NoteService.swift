//
//  File.swift
//  SheHacks2018
//
//  Created by Haejin Jo on 1/27/18.
//  Copyright © 2018 Haejin Jo. All rights reserved.
//

import Foundation
import FirebaseDatabase


struct NoteService {
    static let ref = Database.database().reference()
    static let notesRef = ref.child("notes") // creates new child-of-root node for locations

    static func create(note: Note) -> Note {
        let noteRef = notesRef.childByAutoId()
        let dict = note.getDict()
        noteRef.setValue(dict) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
            }
        }
        return note
    }
    
    static func retrieve(completion: @escaping([Note]) -> Void) {
        var noteArray = [Note]()
        let notesRef = Database.database().reference().child("notes")
        
        notesRef.observe(DataEventType.value, with: { (snapshot) in
            for noteSnapshot in snapshot.children {
                if let note = Note(snapshot: noteSnapshot as! DataSnapshot) {
                    noteArray.append(note)
                }
            }
            completion(noteArray)
        })
    }
}


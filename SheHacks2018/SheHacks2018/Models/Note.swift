//
//  Comment.swift
//  SheHacks2018
//
//  Created by Haejin Jo on 1/27/18.
//  Copyright © 2018 Haejin Jo. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Note {
    
    let content:String
    let writer: String
    let nid: String?
    
    func getDict() -> [String: Any] {
        var noteDict = [String: Any]()
        noteDict["content"] = self.content
        noteDict["writer"] = self.writer
        
        return noteDict
    }
    
    init(content: String, username: String) {
        self.content = content
        self.writer = username
        self.nid = ""
    }
    
    init? (snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String: Any],
            let content = dict["content"] as? String,
            let writer = dict["writer"] as? String
            else { return nil }
        self.content = content
        self.writer = writer
        self.nid = snapshot.key

    }
    
}

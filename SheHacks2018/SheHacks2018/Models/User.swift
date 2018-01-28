//
//  User.swift
//  SheHacks2018
//
//  Created by Admin on 1/26/18.
//  Copyright © 2018 Haejin Jo. All rights reserved.
//

import Foundation
import FirebaseDatabase

class User {
//    private static var _current: User?
    let uid: String
    let username: String
    
//    // computed variable only containing a getter
//    static var current: User {
//        guard let currentUser = _current else{
//            fatalError("current user doesn't exist!")
//        }
//        return currentUser
//    }
//
//    static func setCurrent(_ user: User) {
//        _current = user
//    }
    
    init (uid: String?, username: String) {
        if let user = uid {
            self.uid = user
        } else {
            self.uid = ""
        }
        self.username = username;
    }
    
    init? (snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String: Any],
        let username = dict["username"] as? String
        else { return nil }
        
        self.uid = snapshot.key
        self.username = username;
    }
    

    
}

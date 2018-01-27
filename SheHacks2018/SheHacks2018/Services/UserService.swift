//
//  UserService.swift
//  SheHacks2018
//
//  Created by Haejin Jo on 1/27/18.
//  Copyright © 2018 Haejin Jo. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth.FIRUser

struct UserService {
    

    // Store under user node
    static func create(_ firUser: User, username: String, completion: @escaping(User?)->Void) {
        
        // make UID the root node of this subtree under "users" node
        let ref = Database.database().reference().child("users").child(firUser.uid)
        
        // dictate the dict you want to store data as
        let userAttributes = ["username": username]
        
        // store your pretty dict into the database, with error checks
        ref.setValue(userAttributes) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
        }
        
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            let user = User(snapshot: snapshot)
            completion(user)
        })
        
    }
    
    
}

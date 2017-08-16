//
//  User.swift
//  start Programming
//
//  Created by make on 8/16/17.
//  Copyright © 2017 Makeschool. All rights reserved.
//
import Foundation
import FirebaseDatabase.FIRDataSnapshot
import Foundation
class User {
    
    // MARK: - Properties
    
    let uid: String
    let username: String
    
    // MARK: - Init
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.username = username
    }
}
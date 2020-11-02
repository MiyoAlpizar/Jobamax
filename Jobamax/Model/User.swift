//
//  User.swift
//  Jobamax
//
//  Created by Miyo Alpízar on 01/11/20.
//

import Foundation

struct User {
    var uid: String
    var email: String?
    var name: String
    var lastName: String
    
    init(uid: String, email: String?, name: String, lastName: String) {
        self.uid = uid
        self.email = email
        self.name = name
        self.lastName = lastName
    }
    
}

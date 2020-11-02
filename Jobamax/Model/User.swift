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
    
    init(uid: String, email: String?) {
        self.uid = uid
        self.email = email
    }
    
}

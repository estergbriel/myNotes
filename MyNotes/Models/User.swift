//
//  User.swift
//  MyNotes
//
//  Created by Esther Gabriel Trivena on 07/03/24.
//

import Foundation
import SwiftData

@Model

class User {
    @Attribute(.unique) var id : String
    @Attribute(.unique) var username : String
    var password : String
    var name : String
    
    @Relationship(deleteRule: .cascade, inverse: \Note.createdBy)
    var notes: [Note]? = [Note]()
    
    init(id: String, username: String, password: String, name: String) {
        self.id = id
        self.username = username
        self.password = password
        self.name = name
    }
    
    init() {
        self.id = ""
        self.username = ""
        self.password = ""
        self.name = ""
    }
}


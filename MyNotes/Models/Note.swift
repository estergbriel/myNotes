//
//  Note.swift
//  MyNotes
//
//  Created by Esther Gabriel Trivena on 07/03/24.
//

import Foundation
import SwiftData

@Model

class Note {
    @Attribute(.unique) var id : String
    var content : String
    var createdAt : Date
    var createdBy : User?
    
    init(id: String, content: String, createdAt: Date, createdBy: User? = nil) {
        self.id = id
        self.content = content
        self.createdAt = createdAt
        self.createdBy = createdBy
    }
}

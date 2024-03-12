//
//  LoginNotes.swift
//  MyNotes
//
//  Created by Esther Gabriel Trivena on 07/03/24.
//

import Foundation
import SwiftUI
import SwiftData

struct RegisterNotes: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort:\User.username, order: .forward)
    var allUser: [User]
    
    @State var username :String = ""
    @State var password :String = ""
    @State var name :String = ""
    
    
    var body: some View {
        VStack
        {
            Text("Name : ")
            TextField("Name : ", text: $name).frame(width: 220).padding(12).background(Color(hex:0xFFCAD4)).cornerRadius(10).foregroundColor(Color(hex: 0x1B3C73))
            Text("Username : ")
            TextField("Username : ", text: $username).frame(width: 220).padding(12).background(Color(hex:0xFFCAD4)).cornerRadius(10).foregroundColor(Color(hex: 0x1B3C73))
            
            Text("Password : ")
            TextField("Password : ", text: $password).frame(width: 220).padding(12).background(Color(hex:0xFFCAD4)).cornerRadius(10).foregroundColor(Color(hex: 0x1B3C73))
            
            Button("Register"){
                let newUser = User(
                    id : UUID().uuidString,
                    username: self.username,
                    password: self.password,
                    name: self.name
                )
                context.insert(newUser)
                
                try? context.save()
                
                username = ""
                name = ""
                password = ""
            }
            
//            List {
//                ForEach(allUser) { user in
//                    Text(user.name)
//                }
//            }
        }
    }
}

#Preview {
    RegisterNotes().modelContainer(
        for: [
            User.self,
            Note.self
        ]
    )
}

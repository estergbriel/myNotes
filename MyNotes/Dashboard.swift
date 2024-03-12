//
//  Dashboard.swift
//  MyNotes
//
//  Created by Esther Gabriel Trivena on 07/03/24.
//

import Foundation
import SwiftUI
import SwiftData

struct Dashboard: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort:\Note.createdAt, order: .forward)
    var allNotes: [Note]
    
    @State var userNotes: [Note] = []
    
    var userLogin : User
    @State var content : String = ""
    
    var body: some View {
        VStack{
            Text("Welcome, \(userLogin.name)")
            
            Text("Content : ")
            TextField("Content : ", text: $content).frame(width: 220).padding(12).background(Color(hex:0xFFCAD4)).cornerRadius(10).foregroundColor(Color(hex: 0x1B3C73))
            
            Button("Tambah Notes"){
                let newNotes = Note(
                    id : UUID().uuidString,
                    content: self.content,
                    createdAt: Date(),
                    createdBy: userLogin
                )
                context.insert(newNotes)
                
                try? context.save()
                
            }.frame(width: 220).padding(12).background(Color(hex:0xFFCAD4)).cornerRadius(10).foregroundColor(Color(hex: 0x1B3C73))
            
            List {
                ForEach(userNotes) { notes in
                    Text(notes.content)
                }
            }
        }
        .onAppear {
            self.userNotes = allNotes.filter { $0.createdBy == userLogin }
        }
        .onChange(of: allNotes) {
            self.userNotes = allNotes.filter { $0.createdBy == userLogin }
        }
    }
}

//#Preview {
//    Dashboard(userLogin : ).modelContainer(
//        for: [
//            User.self,
//            Note.self
//        ]
//    )
//}

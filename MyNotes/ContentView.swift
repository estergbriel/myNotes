//
//  ContentView.swift
//  MyNotes
//
//  Created by Esther Gabriel Trivena on 07/03/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var notes = ""
    @State var username = ""
    @State var password = ""
    
    @State var arrNotes = []
    
    @State var showLogin = false
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Welcome to my notes").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                Text("Login").frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).padding(12).background(Color.blue).foregroundColor(.white).cornerRadius(10).onTapGesture {
                    showLogin.toggle()
                }
                
                NavigationLink{
                    RegisterNotes()
                }label: {
                    Text("Register").frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).padding(12).background(Color.blue).foregroundColor(.white).cornerRadius(10)
                }

            }
            .padding()
            .sheet(isPresented: self.$showLogin, content: {
                    ShowLogin()
            })
            
        }
    }
}

struct ShowLogin : View {
    @Environment(\.modelContext) private var context
    
    @Query(sort:\User.username, order: .forward)
    var allUser: [User]
    
    @State var username :String = ""
    @State var password :String = ""
    
    @State var loggedUser: User? = nil
    
    @State var userFound :Bool = false
    
    var body: some View {
        NavigationStack {
            VStack
            {
                Text("Username : ")
                TextField("Username : ", text: $username).frame(width: 220).padding(12).background(Color(hex:0xFFCAD4)).cornerRadius(10).foregroundColor(Color(hex: 0x1B3C73))
                
                Text("Password : ")
                TextField("Password : ", text: $password).frame(width: 220).padding(12).background(Color(hex:0xFFCAD4)).cornerRadius(10).foregroundColor(Color(hex: 0x1B3C73))
                
                Button("Login"){
                    for user in allUser{
                        if (user.username == username && user.password == password){
                            userFound = true
                            loggedUser = user
                        }
                    }
                }
            }.navigationDestination(isPresented: $userFound){
                Dashboard(userLogin: loggedUser ?? User())
            }
        }
    }
}

#Preview {
    ContentView().modelContainer(
        for: [
            User.self,
            Note.self
        ]
    )
}

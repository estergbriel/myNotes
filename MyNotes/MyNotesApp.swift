//
//  MyNotesApp.swift
//  MyNotes
//
//  Created by Esther Gabriel Trivena on 07/03/24.
//

import SwiftUI
import SwiftData

@main
struct MyNotesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(
                for: [
                    User.self,
                    Note.self
                ]
            )
        }
    }
}

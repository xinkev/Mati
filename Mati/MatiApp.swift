//
//  MatiApp.swift
//  Mati
//
//  Created by xinkev on 20/06/2023.
//

import SwiftUI

@main
struct MatiApp: App {
    @Environment(\.openWindow) var openWindow

    var body: some Scene {
        MenuBarExtra("Mati") {
            Button("Settings...") {
                openWindow(id: "settings")
            }.keyboardShortcut(",")
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }.keyboardShortcut("q")
        }
        
        Window("Settings", id: "settings") {
            SettingsView()
        }
    }
}

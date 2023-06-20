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
        MenuBarExtra {
            Button("Settings...") {
                openWindow(id: "settings")
            }.keyboardShortcut(",")
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }.keyboardShortcut("q")
        }  label: {
            let config = NSImage.SymbolConfiguration(pointSize: 16, weight: .light)
            let symbol = NSImage(systemSymbolName: "globe", accessibilityDescription: "Mati App Icon")
            Image(nsImage: symbol!.withSymbolConfiguration(config)!)
        }
        
        Window("Settings", id: "settings") {
            SettingsView()
        }
    }
}

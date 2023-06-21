//
//  AppDelegate.swift
//  Mati
//
//  Created by xinkev on 21/06/2023.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    private var settingsWindow: NSWindow?
    private var statusItem: NSStatusItem!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        showSettings()
        showSettings()
    }
    
    private func showSettings() {
        if settingsWindow == nil {
            settingsWindow = NSWindow(
                contentRect: NSRect(x: 0, y: 0, width: 480, height: 270),
                styleMask: [.miniaturizable, .closable, .resizable, .titled],
                backing: .buffered,
                defer: false
            )
            settingsWindow!.center()
            settingsWindow!.title = "Mati Settings"
        }
        settingsWindow!.makeKeyAndOrderFront(nil)
        settingsWindow!.orderFrontRegardless()
    }
}

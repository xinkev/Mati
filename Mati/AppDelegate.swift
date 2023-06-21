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
    private var popover: NSPopover!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        setupStatusItem()
        setupPopOver()
    }
    
    private func setupStatusItem() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        if let button = statusItem.button {
            let config = NSImage.SymbolConfiguration(pointSize: 16, weight: .light)
            let symbol = NSImage(systemSymbolName: "globe", accessibilityDescription: "Mati App Icon")
            
            button.image =  symbol!.withSymbolConfiguration(config)!
            button.action = #selector(handleStatusItemClick)
        }
    }
    
    private func setupPopOver() {
        popover = NSPopover()
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: PopOverWindow())
    }
    
    func showSettings() {
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
    
    @objc func handleStatusItemClick() {
        if let button = statusItem?.button {
            if (popover.isShown) {
                popover.performClose(nil)
            } else {
                let buttonRect = button.convert(button.bounds, to: nil)
                let popoverSize = PopOverWindow.size
                
                popover.contentViewController?.view.frame = NSRect(origin: .zero, size: popoverSize)
                popover.show(relativeTo: buttonRect, of: button, preferredEdge: .maxX)
            }
        }
    }
}

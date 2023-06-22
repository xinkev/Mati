//
//  AppDelegate.swift
//  Mati
//
//  Created by xinkev on 21/06/2023.
//

import SwiftUI
import ServiceManagement

class AppDelegate: NSObject, NSApplicationDelegate {
    private var settingsWindow: NSWindow?
    private var statusItem: NSStatusItem!
    private var popover: NSPopover!
    private var observer: NSObjectProtocol?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        setupStatusItem()
        setupPopOver()
        
        observer = NotificationCenter.default.addObserver(forName: UserDefaults.didChangeNotification, object: nil, queue: nil) { [unowned self] notif in
            let shouldLaunchAtLogin = UserDefaults.standard.bool(forKey: "launchAtLogin")
            self.toggleLaunchAtLogin(isOn: shouldLaunchAtLogin)
        }
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
        popover.contentViewController = PopOverViewController(rootView: PopOverWindow())
    }
    
    func showSettings() {
        if settingsWindow == nil {
            settingsWindow = NSWindow(
                contentRect: NSRect(x: 0, y: 0, width: 480, height: 270),
                styleMask: [.closable, .titled],
                backing: .buffered,
                defer: false
            )
            settingsWindow!.center()
            settingsWindow!.title = "Mati Settings"
            settingsWindow?.contentViewController = NSHostingController(rootView: SettingsView())
        }
        settingsWindow!.makeKeyAndOrderFront(nil)
        settingsWindow!.orderFrontRegardless()
    }
    
    private func toggleLaunchAtLogin(isOn: Bool) {
        // register app to launch at startup
        let service = SMAppService()
        do {
            if (isOn) {
                try service.register()
            } else {
                try service.unregister()
            }
        } catch {
            print(error)
        }
    }
    
    @objc func handleStatusItemClick() {
        if let button = statusItem?.button {
            if (popover.isShown) {
                popover.performClose(nil)
            } else {
                let buttonRect = button.convert(button.bounds, to: nil)
                let popoverSize = PopOverWindow.size
                
                popover.contentViewController?.view.frame = NSRect(origin: .zero, size: popoverSize)
                popover.show(relativeTo: buttonRect, of: button, preferredEdge: .minY)
                popover.becomeFirstResponder()
            }
        }
    }
}

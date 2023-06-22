//
//  PopOverWindow.swift
//  Mati
//
//  Created by xinkev on 21/06/2023.
//

import SwiftUI

struct PopOverWindow: View {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(spacing: 0) {
            // Tab Bar
            HStack {
                Button(action: {
                    NSApplication.shared.terminate(nil)
                }) {
                    Image(systemName: "power.circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .keyboardShortcut("q")
                .buttonStyle(.borderless)
                
                Spacer()
                
                
                Picker("", selection: $selectedTab) {
                    Text("Translator").tag(0).keyboardShortcut("t")
                    Text("Settings").tag(1).keyboardShortcut(",")
                }
                .pickerStyle(SegmentedPickerStyle())
                .fixedSize()
            }.padding()
            
            // Content
            if selectedTab == 0 {
                GTranslateWebView()
                    .frame(width: PopOverWindow.size.width, height: PopOverWindow.size.height)
            } else {
                SettingsView()
            }
        }
    }
}

extension PopOverWindow {
    static let size = NSSize(width: 1000, height: 370)
}

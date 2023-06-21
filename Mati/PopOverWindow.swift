//
//  PopOverWindow.swift
//  Mati
//
//  Created by xinkev on 21/06/2023.
//

import SwiftUI

struct PopOverWindow: View {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some View {
        VStack {
            HStack{
                Spacer()
                ButtonWithShortcutLabel(label: "Quit", shortcut: "⌘ Q") {
                    NSApplication.shared.terminate(nil)
                }.keyboardShortcut("q")
                ButtonWithShortcutLabel(label: "Settings...", shortcut: "⌘ ,") {
                    appDelegate.showSettings()
                }.keyboardShortcut(",")
            }.padding(EdgeInsets(top: 8, leading: 16, bottom: 4, trailing: 16))
            GTranslateWebView().frame(width: PopOverWindow.size.width, height: PopOverWindow.size.height)
        }
    }
}

struct ButtonWithShortcutLabel: View {
    var label: String
    var shortcut: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(label)
                Text(shortcut)
                    .font(Font.system(size: 12))
                    .foregroundColor(.secondary)
            }
        }
    }
}


struct ButtonWithShortcutLabel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonWithShortcutLabel(label: "Quit", shortcut: "⌘ Q", action: {})
    }
}

extension PopOverWindow {
    static let size = NSSize(width: 1000, height: 370)
}

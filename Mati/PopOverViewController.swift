//
//  PopOverViewController.swift
//  Mati
//
//  Created by xinkev on 21/06/2023.
//
import SwiftUI

class PopOverViewController<Content: View>: NSViewController {
    init(rootView: Content) {
        super.init(nibName: nil, bundle: nil)
        let hostingController = NSHostingController(rootView: rootView)
        addChild(hostingController)
        view = hostingController.view
    }
    
    override func keyDown(with event: NSEvent) {
        if event.modifierFlags.contains(.command) {
            switch event.charactersIgnoringModifiers {
            case "x":
                NSApp.sendAction(#selector(NSText.cut(_:)), to: nil, from: nil)
            case "c":
                NSApp.sendAction(#selector(NSText.copy(_:)), to: nil, from: nil)
            case "v":
                NSApp.sendAction(#selector(NSText.paste(_:)), to: nil, from: nil)
            case "a":
                NSApp.sendAction(#selector(NSResponder.selectAll(_:)), to: nil, from: nil)
            case "z":
                 undoManager?.undo()
            default:
                super.keyDown(with: event)
            }
        } else {
            super.keyDown(with: event)
        }
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

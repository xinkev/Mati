//
//  WebView.swift
//  Mati
//
//  Created by xinkev on 21/06/2023.
//

import SwiftUI
import WebKit

struct GTranslateWebView: NSViewRepresentable {
    private let url: URL = URL(string: "https://translate.google.com?text=")!
    
    func makeNSView(context: Context) -> WKWebView {
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let configurations = WKWebViewConfiguration()
        configurations.defaultWebpagePreferences = preferences
        
        return WKWebView(frame: CGRect.zero, configuration: configurations)
    }
    
    func updateNSView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}


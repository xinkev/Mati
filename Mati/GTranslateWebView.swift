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
        
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preferences
        
        let webView = WKWebView(frame: CGRect.zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator // Set the navigation delegate
        webView.isHidden = true
        return webView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func updateNSView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            // Inject JavaScript to remove <header> tag
            let jsCode = """
                    var header = document.querySelector('header');
                    if (header) {
                        header.remove();
                    }
                    var whiteSpace = document.querySelector(".VjFXz");
                    if (whiteSpace) {
                        whiteSpace.remove();
                    }
                    """
            webView.evaluateJavaScript(jsCode) { _, _ in
                // After JavaScript injection is complete, show the webpage
                webView.isHidden = false
            }
        }
    }
}


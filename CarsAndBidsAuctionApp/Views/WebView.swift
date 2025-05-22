//  WebView.swift
//  CarsAndBidsAuctionAp
//  Created by George Garcia on 5/22/25.

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    @Binding var isLoading: Bool
    let url: URL
        
    func makeUIView(context: Context) -> WKWebView {
        
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.mediaTypesRequiringUserActionForPlayback = []

        configuration.websiteDataStore = WKWebsiteDataStore.default()

        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true

        var request = URLRequest(url: url)
        request.cachePolicy = .returnCacheDataElseLoad

        webView.load(request)
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        if webView.url != url {
            var request = URLRequest(url: url)
            request.cachePolicy = .returnCacheDataElseLoad
            webView.load(request)       
         }
     }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.isLoading = true
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
        }
        
        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            parent.isLoading = false
            print("WebView navigation failed: \(error.localizedDescription)")
            // You might want to add error handling here, e.g., show an alert
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            parent.isLoading = false
            print("WebView navigation failed: \(error.localizedDescription)")
        }
    }
}

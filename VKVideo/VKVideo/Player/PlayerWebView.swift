//
//  PlayerWebView.swift
//  VKVideo
//
//  Created by Maxim Zakopaylov on 07.05.2022.
//

import SwiftUI
import WebKit

struct PlayerWebView: UIViewRepresentable {
    
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

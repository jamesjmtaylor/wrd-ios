//
//  WebView.swift
//  wrdcalculator
//
//  Created by James Taylor on 11/16/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {

    let request: URLRequest

    func makeUIView(context: Context) -> WKWebView  {
        let webView = WKWebView()
        webView.backgroundColor = .clear
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }

}

#if DEBUG
struct WebView_Previews : PreviewProvider {
    static var previews: some View {
        WebView(request: URLRequest(url: URL(string: "https://www.apple.com")!))
    }
}
#endif

//
//  SVGView.swift
//  CiklumTest
//
//  Created by Kyle on 9/20/19.
//  Copyright © 2019 Kramarchuk Kyrylo. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class SVGView: UIView {
    
    var webView: WKWebView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialSetup()
    }
    
    func load(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
    
    // MARK: - Private
    
    private func initialSetup() {
        // Some hack with custom js to make contentSize fitting within device screen bounds
        // Spoiler: didn't work for me :(
        let jscript = "var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); meta.setAttribute('initial-scale', '1.0'); meta.setAttribute('maximum-scale', '1.0'); meta.setAttribute('minimum-scale', '1.0'); meta.setAttribute('user-scalable', 'no'); document.getElementsByTagName('head')[0].appendChild(meta);"
        
        let userScript = WKUserScript(source: jscript, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        let wkUController = WKUserContentController()
        wkUController.addUserScript(userScript)
        let wkWebConfig = WKWebViewConfiguration()
        wkWebConfig.userContentController = wkUController
        
        let webView = WKWebView(frame: .zero, configuration: wkWebConfig)
        webView.contentMode = .scaleAspectFit
        webView.scrollView.isScrollEnabled = false
        webView.backgroundColor = .clear
        webView.navigationDelegate = self
        self.webView = webView
        webView.add(into: self)
    }
}

// MARK: - WKNavigationDelegate

extension SVGView: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let contentSize = webView.scrollView.contentSize
        let webViewSize = webView.bounds.size
        let scaleFactor = webViewSize.width / contentSize.width

        webView.scrollView.minimumZoomScale = scaleFactor
        webView.scrollView.maximumZoomScale = scaleFactor
        webView.scrollView.zoomScale = scaleFactor
    }
}

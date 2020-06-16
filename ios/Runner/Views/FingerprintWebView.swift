//
//  FingerprintWebView.swift
//  Runner
//
//  Created by andy.bin on 2020/6/16.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import UIKit
import WebKit


class FingerprintWebView: WKWebView, WKScriptMessageHandler {
    
    let userContentController: WKUserContentController
    let result: FlutterResult
    
    init(url: URL, result: @escaping FlutterResult) {
        self.result = result
        userContentController = WKUserContentController()
        let config = WKWebViewConfiguration()
        config.userContentController = userContentController
        super.init(frame: UIScreen.main.bounds, configuration: config)
        userContentController.add(self, name: "FingerprintWebView")
        self.alpha = 0
        self.load(URLRequest(url: url))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //WKUIDelegate
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if let fingerprint = message.body as? String {
            result(fingerprint)
            self.removeFromSuperview()
        }
    }
    
}

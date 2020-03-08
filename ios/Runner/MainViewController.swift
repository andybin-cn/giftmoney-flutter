//
//  MainViewController.swift
//  Runner
//
//  Created by binea on 2020/3/8.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import UIKit

class MainViewController: FlutterViewController {
    private let CHANNEL = "giftmoney_flutter/utils"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let engine = self.engine else {
            return
        }
        let commonChannel = FlutterMethodChannel.init(name: CHANNEL, binaryMessenger: engine.binaryMessenger)
        commonChannel.setMethodCallHandler { (call, result) in
            self.onMethodCallHandler(call: call, result: result)
        }
    }
    
    func onMethodCallHandler(call: FlutterMethodCall, result: FlutterResult) {
        if (call.method == "exportExcel") {
            guard let arguments = call.arguments as? Dictionary<String, Any> else {
                result(nil)
                return
            }
            guard let filePath = arguments["destinationPath"] as? String, let data = arguments["data"] as? Array<Any> else {
                result(nil)
                return
            }
            //TODO
            let datas = data.map { (row) -> Array<String> in
                let row2 = row as? Array<Any> ?? Array<Any>()
                return row2.map { (value) -> String in
                    return "\(value)"
                }
            }
            let fileUrl = XLSXManager.shared.save(data: datas, filePath: filePath)
            result(fileUrl)
        } else if (call.method == "shareFile") {
            guard let arguments = call.arguments as? Dictionary<String, Any> else {
                return
            }
            guard let filePath = arguments["filePath"] as? String else {
                return
            }
            //TODO
            self.present(TempExcelPreviewVC(url: URL(fileURLWithPath: filePath)), animated: true, completion: nil)
        } else if (call.method == "openFileManager") {
            guard let arguments = call.arguments as? Dictionary<String, Any> else {
                return
            }
            guard let filePath = arguments["filePath"] as? String else {
                return
            }
            //TODO
        } else if (call.method == "readExcel") {
            guard let arguments = call.arguments as? Dictionary<String, Any> else {
                return
            }
            guard let filePath = arguments["filePath"] as? String else {
                return
            }
            //TODO
            let data = XLSXManager.shared.readXLSData(filePath: filePath)
            result(data)
        }
    }
}

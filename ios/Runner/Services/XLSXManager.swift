//
//  XLSXManager.swift
//  Runner
//
//  Created by binea on 2020/3/8.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation

class XLSXManager {
    
    static let shared = XLSXManager()
    
    private init() {
        
    }
    
    func save(data: Array<Array<String>>, filePath: String) -> String? {
        let workPath = "\(NSTemporaryDirectory())excelExport"
        guard let originFilePath = Bundle.main.path(forResource: "empty", ofType: "xlsx") else {
            return nil
        }
        let spreadsheet: BRAOfficeDocumentPackage = BRAOfficeDocumentPackage.open(originFilePath)
        do {
            if FileManager.default.fileExists(atPath: workPath) {
                let contentsOfPath = try FileManager.default.contentsOfDirectory(atPath: workPath)
                try contentsOfPath.forEach { (content) in
                    try FileManager.default.removeItem(atPath: "\(workPath)/\(content)")
                }
            }
            try FileManager.default.createDirectory(atPath: workPath, withIntermediateDirectories: true, attributes: nil)
        } catch _ {
            return nil
        }
        let worksheet: BRAWorksheet = spreadsheet.workbook.worksheets[0] as! BRAWorksheet
        data.enumerated().forEach { (arg0) in
            let (rowIndex, rowData) = arg0
            rowData.enumerated().forEach { (arg1) in
                let (columIndex, value) = arg1
                let cell = worksheet.cell(forCellReference: BRACell.cellReference(forColumnIndex: columIndex, andRowIndex: rowIndex), shouldCreate: true)
                cell?.setStringValue(value)
            }
        }
        spreadsheet.save(as: filePath)
        return filePath
    }
    
    func readXLSData(filePath: String) -> Array<Array<String>>? {
        var result = Array<Array<String>>()
        let spreadsheet = BRAOfficeDocumentPackage.open(filePath)
        guard let firstWorksheet = spreadsheet?.workbook?.worksheets?.first as? BRAWorksheet else {
            return nil
        }
        firstWorksheet.rows.forEach { (row) in
            if let row = row as? BRARow {
                var rowData = Array<String>()
                row.cells.forEach { (cell) in
                    if let cell = cell as? BRACell {
                        rowData.append(cell.stringValue())
                    } else {
                        rowData.append("")
                    }
                }
                result.append(rowData)
            }
        }
        return result
    }
}

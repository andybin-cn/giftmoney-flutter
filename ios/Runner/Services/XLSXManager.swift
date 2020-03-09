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
        let file = NSString(format: "%@", filePath)
        let workbook = workbook_new(file.fileSystemRepresentation)
        guard let worksheet1 = workbook_add_worksheet(workbook, "sheet1") else {
            return nil
        }
        data.enumerated().forEach { (arg0) in
            let (rowIndex, rowData) = arg0
            rowData.enumerated().forEach { (arg1) in
                let (columIndex, value) = arg1
                worksheet_write_string(worksheet1, lxw_row_t(rowIndex), lxw_col_t(columIndex), value, nil)
            }
        }
        workbook_close(workbook)
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

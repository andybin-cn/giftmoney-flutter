package com.andybin.giftmoney

import android.util.Log
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import java.io.FileOutputStream
import java.lang.Exception

object ExcelReaderWriter {
    fun exportExcel(path: String, data: List<List<String>>) {
        val workbook = HSSFWorkbook()
        val sheet = workbook.createSheet()
        data.forEachIndexed { row, list ->
            val row = sheet.createRow(row)
            list.forEachIndexed { column, value ->
                val cell = row.createCell(column)
                cell.setCellValue(value)
            }
        }

        var outputStream: FileOutputStream? = null
        try {
            outputStream = FileOutputStream(path)
            workbook.write(outputStream)
        } catch (e: Exception) {
            Log.e("ExcelReaderWriter", "workbook write to filed", e)
        } finally {
            if (outputStream != null) {
                outputStream.close()
            }
            workbook.close()
        }
    }
}

package com.example.giftmoney_flutter

import android.util.Log
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import java.io.FileOutputStream
import java.lang.Exception

object ExcelReaderWriter {
    fun exportExcel(path: String, data: List<List<String>>) {
        val headers = listOf("id", "姓名", "关系", "事件名称", "事件时间", "类型", "金额", "图片", "创建时间", "修改时间")
        val workbook = HSSFWorkbook()
        val sheet = workbook.createSheet()
//        val row = sheet.createRow(0)
//        headers.forEachIndexed { index, header ->
//            val cell = row.createCell(index)
//            cell.setCellValue(header)
//        }

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

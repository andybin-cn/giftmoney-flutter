package com.andybin.giftmoney

import android.util.Log
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import org.apache.poi.ss.usermodel.Workbook
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.io.InputStream

object ExcelReaderWriter {
    fun exportExcel(path: String, data: List<List<String>>) {
        val workbook = HSSFWorkbook()
        val sheet = workbook.createSheet()
        data.forEachIndexed { rowIndex, list ->
            val row = sheet.createRow(rowIndex)
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

    /**
     * 判断文件是否是excel
     * @throws Exception
     */
    fun checkExcelVaild(file: File): Boolean {
        if(!file.exists()){
            return false
        }
        if(!(file.isFile() && (file.getName().endsWith("xls") || file.getName().endsWith("xlsx")))){
            return false
        }
        return true
    }

    fun getWorkbok(input: InputStream, file: File): Workbook? {
        var wb: Workbook? = null
        if(file.getName().endsWith("xls")){  //Excel 2003
            wb = HSSFWorkbook(input);
        } else if(file.getName().endsWith("xlsx")){
            wb = XSSFWorkbook(input);
        }
        return wb
    }

    fun readExcel(path: String): List<List<String>>  {
        var result = ArrayList<List<String>>()
        val file = File(path)
        val input = FileInputStream(file)
        if (!checkExcelVaild(file)) {
            return result
        }
        var workbook = getWorkbok(input, file)
        if (workbook == null) {
            return result
        }
        if (workbook.numberOfSheets == 0) {
            return result
        }
        val sheet = workbook.getSheetAt(0)
        for (row in sheet) {
            result.add(row.map { it.stringCellValue })
        }
        return result
    }
}

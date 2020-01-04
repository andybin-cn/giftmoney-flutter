package com.example.giftmoney_flutter

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.async
import kotlinx.coroutines.withContext
import java.lang.Exception

class MainActivity: FlutterActivity() {
    private val CHANNEL = "giftmoney_flutter/utils"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "exportExcel") {
                val filePath = call.argument<String>("destinationPath")
                val data = call.argument<List<List<String>>>("data")
                if (filePath != null && data != null) {
                    GlobalScope.async {
                        try {
                            var filePath = ExcelReaderWriter.exportExcel(filePath, data)
                            withContext(Dispatchers.Main) {
                                result.success(filePath)
                            }
                        } catch (e: Exception) {
                            result.error("-1", "导出失败", null)
                        }
                    }
                } else {
                    result.error("-2", "参数 destinationPath 和 data 不能为空", null)
                }
            }
        }
    }
}

package com.example.giftmoney_flutter

import android.os.Bundle
import androidx.annotation.NonNull;
import io.flutter.app.FlutterApplication
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
                GlobalScope.async {
                    try {
                        var filePath = ExcelReaderWriter.exportExcel()
                        withContext(Dispatchers.Main) {
                            result.success(filePath)
                        }
                    } catch (e: Exception) {
                        result.error("-1", "导出失败", null)
                    }
                }
            }
        }
    }
}

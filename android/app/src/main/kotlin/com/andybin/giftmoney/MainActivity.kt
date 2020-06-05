package com.andybin.giftmoney

import android.content.Intent
import android.graphics.Bitmap
import android.os.Parcel
import android.os.Parcelable
import android.view.View
import android.webkit.*
import android.widget.FrameLayout
import android.widget.RelativeLayout
import androidx.annotation.NonNull
import androidx.core.content.ContextCompat
import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.async
import kotlinx.coroutines.withContext

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
                            ExcelReaderWriter.exportExcel(filePath, data)
                            withContext(Dispatchers.Main) {
                                result.success(filePath)
                            }
                        } catch (e: Exception) {
                            withContext(Dispatchers.Main) {
                                result.error("-1", e.localizedMessage, e)
                            }
                        }
                    }
                } else {
                    result.error("-2", "参数 destinationPath 和 data 不能为空", null)
                }
            } else if (call.method == "shareFile") {
                val filePath = call.argument<String>("filePath")
                val subject = call.argument<String>("subject")
                if (filePath != null && subject != null) {
                    DocumentProvider.shareFile(filePath, subject, this)
                }
            } else if (call.method == "openFileManager") {
                val filePath = call.argument<String>("filePath")
                if (filePath != null) {
                    DocumentProvider.openFileManager(filePath, this)
                }
            } else if (call.method == "readExcel") {
                val filePath = call.argument<String>("filePath")
                if (filePath != null) {
                    GlobalScope.async {
                        try {
                            var excelData = ExcelReaderWriter.readExcel(filePath)
                            withContext(Dispatchers.Main) {
                                result.success(excelData)
                            }
                        } catch (e: Exception) {
                            withContext(Dispatchers.Main) {
                                result.error("-1", e.localizedMessage, e)
                            }
                        }
                    }
                }
            } else if (call.method == "startWebView") {
                val url = call.argument<String>("url")
                if (url != null) {
                    startWebView(url, result)
                }
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == 100) {

        }
    }

    fun startWebView(url: String, result: MethodChannel.Result) {
        var webView = WebView(this)
        webView.visibility = View.GONE
        val params3 = FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT)
        this.addContentView(webView, params3)
        var webSettings = webView.getSettings()
        webSettings.setJavaScriptEnabled(true);
        webSettings.setJavaScriptCanOpenWindowsAutomatically(true);
        webSettings.setCacheMode(WebSettings.LOAD_NO_CACHE);
        webSettings.setDomStorageEnabled(true);
        webSettings.setDatabaseEnabled(true);
        webSettings.setAppCacheEnabled(true);
        webSettings.setAllowFileAccess(true);
//        webSettings.setSavePassword(true);
        webSettings.setSupportZoom(true);
        webSettings.setBuiltInZoomControls(true);
        webSettings.setLayoutAlgorithm(WebSettings.LayoutAlgorithm.NORMAL);
        webSettings.setUseWideViewPort(true);
        webView.setBackgroundColor(ContextCompat.getColor(this,android.R.color.transparent));
//        webView.webViewClient = MyViewClient(result)
        webView.addJavascriptInterface(AndroidtoJs(result), "giftmoneyObject")
        webView.loadUrl(url)
    }
}

private class MyViewClient(result: MethodChannel.Result) : WebViewClient() {
    val result = result
    override fun shouldOverrideUrlLoading(view: WebView?, request: WebResourceRequest?): Boolean {
        val url = request?.url.toString()
        Log.i("utils shouldOverrideUrlLoading", url ?: "null")
        if(url != null && url.startsWith("http://giftmoney.com/")) {
            var content = url.split("http://giftmoney.com/").last()
            result.success(content)
            return true
        }
        return false
    }
}

// 继承自Object类
public class AndroidtoJs(result: MethodChannel.Result) {
    val result = result
    @JavascriptInterface
    fun handleFingerprint(msg: String) {
        withContext(Dispatchers.Main) {
            result.success(msg)
        }
    }
}

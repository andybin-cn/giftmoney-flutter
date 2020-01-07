package com.andybin.giftmoney

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.net.Uri
import androidx.core.content.FileProvider
import java.io.File

object DocumentProvider {
    fun shareFile(path: String, subject: String, context: Context) {
        val intent = Intent(Intent.ACTION_SEND);
        intent.setType("application/octet-stream");
        intent.putExtra(Intent.EXTRA_SUBJECT, subject);
//        intent.putExtra(Intent.EXTRA_TEXT, "I have successfully share my message through my app");
        val uri = FileProvider.getUriForFile(context,"com.andybin.giftmoney", File(path))
//        val uri = Uri.fromFile(File(path))
        intent.putExtra(Intent.EXTRA_STREAM, uri)
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        context.startActivity(Intent.createChooser(intent, ""))
    }

    fun openFileManager(path: String, context: Activity) {
        val intent = Intent(Intent.ACTION_GET_CONTENT)
        intent.addCategory(Intent.CATEGORY_OPENABLE)
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        val uri = Uri.fromFile(File(path))
//        val uri = FileProvider.getUriForFile(context,"com.andybin.giftmoney", File(path))
        intent.setDataAndType(uri, "file/*")

        context.startActivity(intent)
    }
}
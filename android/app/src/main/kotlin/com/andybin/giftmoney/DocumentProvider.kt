package com.andybin.giftmoney

import android.content.Context
import android.content.Intent
import android.net.Uri
import androidx.core.content.FileProvider
import java.io.File

object DocumentProvider {
    fun shareFile(path: String, subject: String, context: Context) {
        val intent = Intent(Intent.ACTION_SEND);
        intent.setType("application/vnd.ms-excel");
        intent.putExtra(Intent.EXTRA_SUBJECT, subject);
//        intent.putExtra(Intent.EXTRA_TEXT, "I have successfully share my message through my app");
        val uri = FileProvider.getUriForFile(context,"com.andybin.giftmoney", File(path))
//        val uri = Uri.fromFile(File(path))
        intent.putExtra(Intent.EXTRA_STREAM, uri)
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        context.startActivity(Intent.createChooser(intent, ""))
    }
}
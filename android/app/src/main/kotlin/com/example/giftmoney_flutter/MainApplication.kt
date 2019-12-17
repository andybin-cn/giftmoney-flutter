package com.example.giftmoney_flutter

import android.app.Activity
import android.os.Bundle
import androidx.annotation.CallSuper
import io.flutter.app.FlutterApplication

class MainApplication : FlutterApplication() {

    @CallSuper
    override fun onCreate() {
        super.onCreate()
        context = applicationContext as? MainApplication

        registerActivityLifecycleCallbacks(object: ActivityLifecycleCallbacks {
            override fun onActivityCreated(activity: Activity?, savedInstanceState: Bundle?) {
                context?.currentActivity = activity
            }
            override fun onActivityStarted(activity: Activity?) {
                context?.currentActivity = activity
            }
            override fun onActivityResumed(activity: Activity?) {
                context?.currentActivity = activity
            }
            override fun onActivityDestroyed(activity: Activity?) {

            }
            override fun onActivityPaused(activity: Activity?) {

            }
            override fun onActivitySaveInstanceState(activity: Activity?, outState: Bundle?) {

            }
            override fun onActivityStopped(activity: Activity?) {

            }
        })
    }


    companion object {
//        var currentActivity: Activity? = null
//            private set

        var context: MainApplication? = null
            private set
    }
}

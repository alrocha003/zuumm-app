package com.example.zuumm_app

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
  
  // FirebaseInstanceId.getInstance().instanceId
  //       .addOnCompleteListener(OnCompleteListener { task ->
  //           if (!task.isSuccessful) {
  //               Log.w(TAG, "getInstanceId failed", task.exception)
  //               return@OnCompleteListener
  //           }

  //           // Get new Instance ID token
  //           val token = task.result?.token

  //           // Log and toast
  //           val msg = getString(R.string.msg_token_fmt, token)
  //           Log.d(TAG, msg)
  //           Toast.makeText(baseContext, msg, Toast.LENGTH_SHORT).show()
  //       })
  }
}

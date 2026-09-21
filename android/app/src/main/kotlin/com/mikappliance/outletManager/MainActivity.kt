package com.mikappliance.outletManager

import com.mikappliance.outletManager.location.TrackingMethodChannel
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        TrackingMethodChannel(applicationContext).register(flutterEngine)
    }
}

package com.example.cineverse

//AI Generated
import android.os.BatteryManager
import android.os.Build
import android.os.Environment
import android.os.StatFs
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import android.util.Log

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.cineverse.device_info"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Log.d("debug ", "kt")

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            // Log.d("debug ", "kt call")
            if (call.method == "getDeviceInfo") {
                // Log.d("debug ", "kt getinfo")
                val batteryLevel = getBatteryLevel()
                val deviceInfo = mapOf(
                    "model" to Build.MODEL,
                    "osVersion" to Build.VERSION.RELEASE,
                    "storage" to getStorageInfo(),
                    "battery" to "$batteryLevel%"
                )
                // Log.d("debug ", "kt info")
                result.success(deviceInfo)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getBatteryLevel(): Int {
        val batteryManager = getSystemService(BATTERY_SERVICE) as BatteryManager
        return batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    }

    private fun getStorageInfo(): String {
        val stat = StatFs(Environment.getDataDirectory().path)
        val bytesAvailable = stat.blockSizeLong * stat.availableBlocksLong
        val gbAvailable = bytesAvailable / (1024 * 1024 * 1024)
        return "$gbAvailable GB"
    }
}
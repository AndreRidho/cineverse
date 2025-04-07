import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  private let CHANNEL = "com.cineverse.device_info"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window.rootViewController as! FlutterViewController
    let deviceChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)

    deviceChannel.setMethodCallHandler { (call, result) in
      if call.method == "getDeviceInfo" {
        result([
          "model": UIDevice.current.model,
          "osVersion": UIDevice.current.systemVersion,
          "storage": self.getStorage(),
          "battery": "\(UIDevice.current.batteryLevel * 100)%"
        ])
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    UIDevice.current.isBatteryMonitoringEnabled = true
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func getStorage() -> String {
    let fileURL = URL(fileURLWithPath: NSHomeDirectory() as String)
    do {
      let values = try fileURL.resourceValues(forKeys: [.volumeAvailableCapacityForImportantUsageKey])
      if let capacity = values.volumeAvailableCapacityForImportantUsage {
        let gb = capacity / (1024 * 1024 * 1024)
        return "\(gb) GB available"
      }
    } catch {}
    return "Unavailable"
  }
}

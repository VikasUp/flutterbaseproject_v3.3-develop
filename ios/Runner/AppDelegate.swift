import UIKit
import Flutter
import Firebase


let kChannel = "app"
let kMethodFlavor = "getFlavor"
let kMethodDeviceId = "getDeviceID"

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)

    if let bundleID: String = Bundle.main.bundleIdentifier {
        
        let pref = UserDefaults.init(suiteName: "group.\(bundleID).notificationext")
        
        pref?.set(0, forKey: "BadgeCount")
        
        pref?.synchronize()
    }
    guard let controller = self.window.rootViewController as? FlutterViewController else { return true }
    let flavorChannel = FlutterMethodChannel(name: kChannel, binaryMessenger: controller as! FlutterBinaryMessenger)
    flavorChannel.setMethodCallHandler { (call, result) in
        if call.method == kMethodFlavor {
            let flavor = Bundle.main.object(forInfoDictionaryKey: "Flavor") as! String
            result(flavor)
        } else if call.method == kMethodDeviceId {
            let deviceId = UIDevice.current.identifierForVendor?.uuidString ?? ""
            result(deviceId)
        }
    }

    // UNUserNotificationCenter.current().delegate = self
     if #available(iOS 10.0, *) {
        UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
      }
    //application.registerForRemoteNotifications()

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

   
}


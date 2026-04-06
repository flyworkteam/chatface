import Flutter
import UIKit
import flutter_local_notifications
import GoogleSignIn
import AuthenticationServices  


@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
        GeneratedPluginRegistrant.register(with: registry)
    }

    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
    }

    GeneratedPluginRegistrant.register(with: self)

    // register for remote notifications so we can set APNs token on Messaging
    UIApplication.shared.registerForRemoteNotifications()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  // Handle custom URL schemes (Google Sign-In) and other URL opens
  override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    // Google Sign-In
    if GIDSignIn.sharedInstance.handle(url) {
      return true
    }

     

    return super.application(app, open: url, options: options)
  }
}

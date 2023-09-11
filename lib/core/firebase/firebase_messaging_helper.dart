
import '/core/index.dart';
import 'dart:convert';
import 'dart:io';
import 'package:base_project/core/index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


/// Notification Json
/*
{
    "to":"cOMuWIHxr0cGijYdWs2ZCo:APA91bHf23LdznJKj_OUNzhUk9q8hO52vgNk_vDo3iTya3WeBeJIbJKRIhJLg_PZsds4tj4zgC5NjZxEAkOlBsYtehOSGDFoGerWb60gu0HnZlcV_a37Olnyi6I-z9w7yQ75Och4xAeH",
    "notification": {
        "alert": "Test notification",
        "body": "Test"
        },
    "data": {
        "title": "Testing Background",
        "message" : "Test",
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "recipientId":"1",
        "type": "REGISTER_OTP"
    },
    "priority": "high",
    "content_available": true,
    "mutable_content": true
}
 */


class FirebaseMessagingHelper {
  FirebaseMessagingHelper._();

  static final FirebaseMessagingHelper _instance = FirebaseMessagingHelper._();

  factory FirebaseMessagingHelper() => _instance;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void configure() async {
    await Firebase.initializeApp();

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        FlutterLocalNotificationHelper().showNotificationWithDefaultSound(
            title: message.notification?.title,
            body: message.notification?.body,
            payload: json.encode(message.data)
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      log.info(message.toString());
      final String? token = await SharedPreferenceHelper.getToken();
      if ((token?.isNotEmpty) ?? false) {
        FlutterLocalNotificationHelper().handleNotificationRedirection(message.data);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log.info(message.toString());
    });

    FirebaseMessaging.onBackgroundMessage(Platform.isAndroid
        ? _firebaseMessagingBackgroundHandler
        : _firebaseMessagingBackgroundHandlerIOS);

    FirebaseMessaging.instance.requestPermission();

    _firebaseMessaging.onTokenRefresh.listen((String? newToken) {
      log.info('Firebase Token: $newToken');
      if (newToken != null) {
        Singleton().setFirebaseToken(newToken);
      }
    });

    // For testing purposes print the Firebase Messaging token
    _firebaseMessaging.getToken().then((token) {
      log.info('Firebase Token: $token');
      Singleton().setFirebaseToken(token!);
    });
  }

  /// Define a top-level named handler which background/terminated messages will
  /// call.
  ///
  /// To verify things are working, check out the native platform logs.
  static Future<dynamic> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    log.info('onAppPush myBackgroundMessageHandler : ${message.data}');
    return Future<dynamic>.value();
  }

  static Future<dynamic> _firebaseMessagingBackgroundHandlerIOS(
      RemoteMessage message) async => Future<dynamic>.value();

}




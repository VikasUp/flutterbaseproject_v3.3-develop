import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';

/*
* Class handling Firebase In-APp Messaging instance and methods
* */
class FirebaseInAppMessagingService {
  FirebaseInAppMessagingService._();

  static final FirebaseInAppMessagingService _instance =
      FirebaseInAppMessagingService._();

  factory FirebaseInAppMessagingService() => _instance;

  final FirebaseInAppMessaging _firebaseInAppMessaging =
      FirebaseInAppMessaging.instance;

  /// Temporary disable in-app messaging
  Future disableFirebaseInAppMessaging() async {
    await _firebaseInAppMessaging.setMessagesSuppressed(false);
  }

  /// Re-enable in-app messaging
  Future enableFirebaseInAppMessaging() async {
    await _firebaseInAppMessaging.setMessagesSuppressed(true);
  }

  /// trigger Firebase In App Messaging Event
  /// Pass name of the event to [eventName] parameter
  /// Example -- Triggering event programmatically
  /// FirebaseInAppMessagingService()
  ///         .triggerEvent(eventName: 'forgot_pwd_pressed');
  Future triggerEvent({required String eventName}) async {
    await _firebaseInAppMessaging.triggerEvent(eventName);
  }

  /// To Trigger in-app message via Analytics custom event see [FirebaseAnalyticsService] class
  /// and [logCustomEvent] method. On Firebase console, campaign needs to be configured to
  /// trigger message on analytics event passed here.
}

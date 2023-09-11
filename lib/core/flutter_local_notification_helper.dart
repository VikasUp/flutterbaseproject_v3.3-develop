import 'dart:convert';
import 'dart:math' as math;

import 'package:base_project/core/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../injection_container.dart';
import 'firebase/index.dart';
import 'notification/notification_payload.dart';

class FlutterLocalNotificationHelper {
  FlutterLocalNotificationHelper._();

  static final FlutterLocalNotificationHelper _instance =
      FlutterLocalNotificationHelper._();

  factory FlutterLocalNotificationHelper() => _instance;

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Create a [AndroidNotificationChannel] for heads up notifications
  late AndroidNotificationChannel channel;

  late math.Random random = math.Random();
  void initializeSettings() async {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onSelectNotification);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    showNotificationWithDefaultSound(
        title: title, body: body, payload: payload);
  }

  /// SHOW LOCAL NOTIFICATION
  /// TODO: Configure as per Project Set up Procedure
  ///  'your channel id', 'your channel name', 'your channel description'
  Future showNotificationWithDefaultSound(
      {String? title, String? body, String? payload}) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'high_importance_channel',
      'baseProject',
      channelDescription: 'base project local notification',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      color: Colors.amber,
      visibility: NotificationVisibility.public,
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    final randomId = random.nextInt(2 ^ 31 - 1);
    log.info('Random ID $randomId');
    await flutterLocalNotificationsPlugin.show(
      randomId,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  Future onSelectNotification(NotificationResponse response) async {
    log.info(
        'NOTIFICATION CLICKED onSelectNotification :::: PAYLOAD ::::: ${response.payload}');

    var payloadJson = jsonDecode(response.payload ?? '');
    if (payloadJson != null) {
      handleNotificationRedirection(payloadJson);
    }
  }

  void handleNotificationRedirection(Map<String, dynamic>? payload) {
    log.info(
        'NOTIFICATION CLICKED :::: handleNotificationRedirection PAYLOAD ::::: $payload');
    if (payload != null) {
      var notificationPayload = NotificationPayload.fromJson(payload);
      serviceLocator<AppNavigator>()
          .handleNotificationRedirection(notificationPayload);
    }
  }

  Future<void> cancelAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}

// To parse this JSON data, do
//
//     final notificationPayload = notificationPayloadFromJson(jsonString);

import 'dart:convert';

NotificationPayload notificationPayloadFromJson(String str) => NotificationPayload.fromJson(json.decode(str));

String notificationPayloadToJson(NotificationPayload data) => json.encode(data.toJson());

class NotificationPayload {
  NotificationPayload({
    this.title,
    this.message,
    this.type,
    this.recipientId,
  });

  String? title;
  String? message;
  String? type;
  String? recipientId;

  factory NotificationPayload.fromJson(Map<String, dynamic> json) => NotificationPayload(
    title: json["title"],
    message: json["message"],
    type: json["type"],
    recipientId: json["recipientId"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "message": message,
    "type": type,
    "recipientId": recipientId,
  };
}

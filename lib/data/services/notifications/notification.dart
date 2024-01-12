// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// var random = new Random();
// PaymentNotification({String? title, String? body}) async {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   ////Set the settings for various platform
//   // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//   const AndroidInitializationSettings initializationSettingsAndroid =
//   AndroidInitializationSettings('@mipmap/ic_launcher');
//   const IOSInitializationSettings initializationSettingsIOS =
//   IOSInitializationSettings(
//     requestAlertPermission: true,
//     requestBadgePermission: true,
//     requestSoundPermission: true,
//   );
//   const LinuxInitializationSettings initializationSettingsLinux =
//   LinuxInitializationSettings(
//     defaultActionName: 'hello',
//   );
//   const InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//       linux: initializationSettingsLinux);
//   await flutterLocalNotificationsPlugin.initialize(
//     initializationSettings,
//   );
//
//   ///
//   const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'high_channel', 'High Importance Notification',
//       description: "This channel is for important notification",
//       importance: Importance.max);
//
//   flutterLocalNotificationsPlugin.show(
//     random.nextInt(10000),
//     title,
//     body,
//     NotificationDetails(
//       android: AndroidNotificationDetails(channel.id, channel.name,
//           channelDescription: channel.description),
//     ),
//   );
// }
//

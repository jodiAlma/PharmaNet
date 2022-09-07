// // Copyright 2019 The Chromium Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.

// // @dart=2.9

// import 'dart:async';
// import 'dart:convert';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'MetaCard.dart';
// import 'TokenMonitor.dart';

// // import 'messaging.dart';
// // import 'message_list.dart';
// // import 'permissions.dart';
// // import 'token_monitor.dart';

// /// Define a top-level named handler which background/terminated messages will
// /// call.
// ///
// /// To verify things are working, check out the native platform logs.
// ///
// final String token =
//     'AAAA_Pvjhhk:APA91bHRr4Q9DWFixyasV4NSl149Stu2-ljUElEalq1Y5j6CZjf_zhVdahROI-7KYOMWtSCKPIKPTtFPG8vyVfsmFF7R4sarT1b1suuO7AEm5Dmzrjfbgj7uRbd4Nbb51Ejb1UgypKh6';
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();
//   print('Handling a background message ${message.messageId}');
// }

// /// Create a [AndroidNotificationChannel] for heads up notifications
// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'high_importance_channel', // id
//   'High Importance Notifications', // title
//   'This channel is used for important notifications.', // description
//   importance: Importance.high,
// );

// /// Initialize the [FlutterLocalNotificationsPlugin] package.
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   // Set the background messaging handler early on, as a named top-level function
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//   /// Create an Android Notification Channel.
//   ///
//   /// We use this channel in the `AndroidManifest.xml` file to override the
//   /// default FCM channel to enable heads up notifications.
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);

//   /// Update the iOS foreground notification presentation options to allow
//   /// heads up notifications.
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );

//   runApp(MessagingExampleApp());
// }

// /// Entry point for the example application.
// class MessagingExampleApp extends StatelessWidget {
//   static String id = '/note';
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Messaging Example App',
//       theme: ThemeData.dark(),
//       routes: {
//         '/': (context) => note(),
//         //'/message': (context) => MessageView(),
//       },
//     );
//   }
// }

// // Crude counter to make messages unique
// int _messageCount = 0;

// /// The API endpoint here accepts a raw FCM payload for demonstration purposes.
// String constructFCMPayload(String token) {
//   _messageCount++;
//   return jsonEncode({
//     'token':
//         'AAAA_Pvjhhk:APA91bHRr4Q9DWFixyasV4NSl149Stu2-ljUElEalq1Y5j6CZjf_zhVdahROI-7KYOMWtSCKPIKPTtFPG8vyVfsmFF7R4sarT1b1suuO7AEm5Dmzrjfbgj7uRbd4Nbb51Ejb1UgypKh6',
//     'data': {
//       'via': 'FlutterFire Cloud Messaging!!!',
//       'count': _messageCount.toString(),
//     },
//     'notification': {
//       'title': 'Hello FlutterFire!',
//       'body': 'This notification (#$_messageCount) was created via FCM!',
//     },
//   });
// }

// /// Renders the example application.
// class note extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _Application();
// }

// class _Application extends State<note> {
//   String _token;

//   @override
//   void initState() {
//     super.initState();
//     // FirebaseMessaging.instance.getToken().then((value) => {
//     //       if (value == null) {print("value")}
//     //     });
//     FirebaseMessaging.instance
//         .getInitialMessage()
//         .then((RemoteMessage message) {
//       if (message != null) {
//         print("ff");
//         //   Navigator.pushNamed(context, '/message',
//         //       arguments: MessageArguments(message, true));
//       }
//     });

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification notification = message.notification;
//       AndroidNotification android = message.notification?.android;

//       if (notification != null && android != null) {
//         flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             notification.body,
//             NotificationDetails(
//               android: AndroidNotificationDetails(
//                 channel.id,
//                 channel.name,
//                 channel.description,
//                 // TODO add a proper drawable resource to android, for now using
//                 //      one that already exists in example app.
//                 icon: 'launch_background',
//               ),
//             ));
//       }
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('A new onMessageOpenedApp event was published!');
//       //   Navigator.pushNamed(context, '/message',
//       //       arguments: MessageArguments(message, true));
//       // });
//     });

//     Future<void> sendPushMessage() async {
//       if (_token == null) {
//         print('Unable to send FCM message, no token exists.');
//         return;
//       }

//       try {
//         await http.post(
//           Uri.parse('https://fcm.googleapis.com/fcm/send'),
//           headers: <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8',
//           },
//           body: constructFCMPayload(_token),
//         );
//         print('FCM request for device sent!');
//       } catch (e) {
//         print(e);
//       }
//     }

//     Future<void> onActionSelected(String value) async {
//       switch (value) {
//         case 'subscribe':
//           {
//             print(
//                 'FlutterFire Messaging Example: Subscribing to topic "fcm_test".');
//             await FirebaseMessaging.instance.subscribeToTopic('fcm_test');
//             print(
//                 'FlutterFire Messaging Example: Subscribing to topic "fcm_test" successful.');
//           }
//           break;
//         case 'unsubscribe':
//           {
//             print(
//                 'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test".');
//             await FirebaseMessaging.instance.unsubscribeFromTopic('fcm_test');
//             print(
//                 'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test" successful.');
//           }
//           break;
//         case 'get_apns_token':
//           {
//             if (defaultTargetPlatform == TargetPlatform.iOS ||
//                 defaultTargetPlatform == TargetPlatform.macOS) {
//               print('FlutterFire Messaging Example: Getting APNs token...');
//               String token = await FirebaseMessaging.instance.getAPNSToken();
//               print('FlutterFire Messaging Example: Got APNs token: $token');
//             } else {
//               print(
//                   'FlutterFire Messaging Example: Getting an APNs token is only supported on iOS and macOS platforms.');
//             }
//           }
//           break;
//         default:
//           break;
//       }
//     }

//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Cloud Messaging'),
//           actions: <Widget>[
//             PopupMenuButton(
//               onSelected: onActionSelected,
//               itemBuilder: (BuildContext context) {
//                 return [
//                   const PopupMenuItem(
//                     value: 'subscribe',
//                     child: Text('Subscribe to topic'),
//                   ),
//                   const PopupMenuItem(
//                     value: 'unsubscribe',
//                     child: Text('Unsubscribe to topic'),
//                   ),
//                   const PopupMenuItem(
//                     value: 'get_apns_token',
//                     child: Text('Get APNs token (Apple only)'),
//                   ),
//                 ];
//               },
//             ),
//           ],
//         ),
//         floatingActionButton: Builder(
//           builder: (context) => FloatingActionButton(
//             onPressed: sendPushMessage,
//             backgroundColor: Colors.white,
//             child: const Icon(Icons.send),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(children: [
//             // MetaCard('Permissions', Permissions()),
//             MetaCard('FCM Token', TokenMonitor((token) {
//               _token = token;
//               return token == null
//                   ? const CircularProgressIndicator()
//                   : Text(token, style: const TextStyle(fontSize: 12));
//             })),
//             //MetaCard('Message Stream', MessageList()),
//           ]),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cloud Messaging'),
//         actions: <Widget>[
//           PopupMenuButton(
//             //onSelected: onActionSelected,
//             itemBuilder: (BuildContext context) {
//               return [
//                 const PopupMenuItem(
//                   value: 'subscribe',
//                   child: Text('Subscribe to topic'),
//                 ),
//                 const PopupMenuItem(
//                   value: 'unsubscribe',
//                   child: Text('Unsubscribe to topic'),
//                 ),
//                 const PopupMenuItem(
//                   value: 'get_apns_token',
//                   child: Text('Get APNs token (Apple only)'),
//                 ),
//               ];
//             },
//           ),
//         ],
//       ),
//       floatingActionButton: Builder(
//         builder: (context) => FloatingActionButton(
//           //onPressed: sendPushMessage,
//           backgroundColor: Colors.white,
//           child: const Icon(Icons.send),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           // MetaCard('Permissions', Permissions()),
//           MetaCard('FCM Token', TokenMonitor((token) {
//             _token = token;
//             return token == null
//                 ? const CircularProgressIndicator()
//                 : Text(token, style: const TextStyle(fontSize: 12));
//           })),
//           // MetaCard('Message Stream', MessageList()),
//         ]),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationsManager {
  static final NotificationsManager _instance = NotificationsManager._internal();
  factory NotificationsManager() => _instance;
  NotificationsManager._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  bool _isConfigured = false;

  var _notificationStreamController = StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> get notification => _notificationStreamController.stream;

  void init() async {
    await requestNotificationPermission();

    _firebaseMessaging.requestPermission();

    if (!_isConfigured) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('======= On Message =======');
        print(message);
        _setStreamData(message.data);
        _saveNotificationToFirestore(message.data);
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('======= On Resume =======');
        print(message);
        _setStreamData(message.data);
        _saveNotificationToFirestore(message.data);
      });

      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

      _isConfigured = true;
    }
  }

  static Future<void> requestNotificationPermission() async {
    var status = await Permission.notification.status;
    if (!status.isGranted) {
      await Permission.notification.request();
    }
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
    _saveNotificationToFirestore(message.data);
  }

  _setStreamData(Map<String, dynamic> notInfo) {
    if (notInfo != null) {
      _notificationStreamController.sink.add(notInfo);
    }
  }

  static void _saveNotificationToFirestore(Map<String, dynamic> data) {
    if (data != null) {
      final userUid = FirebaseAuth.instance.currentUser!.uid;
      FirebaseFirestore.instance.collection('Parents').doc(userUid)
          .collection('notifications').add({
        'title': data['notification']['title'],
        'body': data['notification']['body'],
        'data': data['data'] ?? {},
        'timestamp': DateTime.now(),
      });
    }
  }

  void dispose() {
    _notificationStreamController.close();
  }
}
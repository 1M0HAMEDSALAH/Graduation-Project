import 'package:flutter/material.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_parent/Home/notification/NotificationsManager.dart';
import '../../../../shared/styles/colors.dart';

class Noti extends StatefulWidget {
  @override
  _NotiState createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  final NotificationsManager _notificationsManager = NotificationsManager();

  @override
  void initState() {
    super.initState();
    _notificationsManager.init(); // تهيئة مدير الإشعارات عند بناء الصفحة
  }

  @override
  void dispose() {
    _notificationsManager.dispose(); // إغلاق مدير الإشعارات عند تدمير الصفحة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Notification",
          style: TextStyle(
            color: defaultColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // استخدم StreamBuilder لعرض الإشعارات عند استقبالها
      body: StreamBuilder<Map<String, dynamic>>(
        stream: _notificationsManager.notification,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // عرض الإشعارات في واجهة المستخدم
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                // استخدم بيانات الإشعار من snapshot.data لعرضها
                return ListTile(
                  title: Text(snapshot.data?[index]['title']),
                  subtitle: Text(snapshot.data?[index]['body']),
                );
              },
            );
          } else {
            // إذا لم يتم استقبال أي إشعارات بعد
            return Center(
              child: Text('No notifications yet'),
            );
          }
        },
      ),
    );
  }
}
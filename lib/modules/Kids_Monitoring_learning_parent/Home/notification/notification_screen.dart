import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../shared/styles/colors.dart';

class Noti extends StatefulWidget {
  @override
  _NotiState createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  List<QueryDocumentSnapshot> NotificationScreen = [];

  _GetNotificationFromFirebase() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Notification').get();
    NotificationScreen.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
    _GetNotificationFromFirebase();
    super.initState();
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
      body: ConditionalBuilder(
        condition: NotificationScreen.length > 0,
        builder: (BuildContext context) => ListView.separated(
          itemBuilder: (context, index) {
            var notification = NotificationScreen[index];
            var finishTimestamp = notification['finish'] as Timestamp;
            var finishDateTime = finishTimestamp.toDate();
            var formattedDate = DateFormat('dd MMMM yyyy, hh:mm:ss a').format(finishDateTime);

            return Dismissible(
              onDismissed: (direction) async {
                await FirebaseFirestore.instance.collection('Notification').doc(NotificationScreen[index].id).delete();
                setState(() {
                  NotificationScreen.removeAt(index);
                });
              },
              key: Key(NotificationScreen[index].id.toString()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: NotiColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              child: Image.asset('assets/images/Logo.jpg'),
                            ),
                            SizedBox(width: 20),
                            Text('Kids Monitor and learning'),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text('Notification'),
                        SizedBox(height: 12),
                        Text(notification['name']),
                        Row(
                          children: [
                            Spacer(),
                            Text(formattedDate),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.grey[300],
            );
          },
          itemCount: NotificationScreen.length,
        ),
        fallback: (BuildContext context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.search_sharp, size: 100, color: Colors.grey),
              Text(
                'No Notification Yet :)',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'default',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

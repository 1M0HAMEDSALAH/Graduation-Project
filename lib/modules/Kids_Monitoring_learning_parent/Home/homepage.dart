import 'package:flutter/material.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_parent/Home/chat/chat_screen.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_parent/Home/dashboard/dashboard_screen.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_parent/Home/location/location_screen.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_parent/Home/notification/notification_screen.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_parent/Home/settings/settings_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  List<Widget> screens = [
    Dashboard(),
    Location(),
    Chats(),
    Noti(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.indigo,
        elevation: 10.0,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_customize_outlined,
              color: Colors.black87,
              size: 35.0,),
            activeIcon: Icon(Icons.dashboard_customize_outlined,
                color: Colors.indigoAccent),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined,
              color: Colors.black87,
              size: 35.0,),
            activeIcon: Icon(Icons.location_on_outlined,
                color: Colors.indigoAccent),
            label: 'location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined,
              color: Colors.black87,
              size: 35.0,),
            activeIcon: Icon(Icons.chat_outlined,
                color: Colors.indigoAccent),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_sharp,
              color: Colors.black87,
              size: 35.0,),
            activeIcon: Icon(Icons.notifications_none_rounded,
                color: Colors.indigoAccent),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined,
              color: Colors.black87,
              size: 35.0,),
            activeIcon: Icon(
                Icons.settings_outlined,
                color: Colors.indigoAccent,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

}
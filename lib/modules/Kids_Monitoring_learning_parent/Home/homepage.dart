import 'package:flutter/material.dart';
import 'package:KidsMonitorAndLearning/modules/Kids_Monitoring_learning_parent/Home/chat/chat_screen.dart';
import 'package:KidsMonitorAndLearning/modules/Kids_Monitoring_learning_parent/Home/dashboard/dashboard_screen.dart';
import 'package:KidsMonitorAndLearning/modules/Kids_Monitoring_learning_parent/Home/notification/notification_screen.dart';
import 'package:KidsMonitorAndLearning/modules/Kids_Monitoring_learning_parent/Home/settings/settings_screen.dart';
import 'package:KidsMonitorAndLearning/shared/styles/colors.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<Widget> screens = [
    Dashboard(),
    //Tasks(),
    Chats(),
    Noti(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar()
  {
    return BottomNavigationBar(
      fixedColor: defaultColor,
      //selectedItemColor: defaultColor,
      elevation: 10.0,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      items: [
        buildBottomNavigationBarItem(
          'assets/Nav_bar_anamation/dashboard.json',
          'Dashboard',
        ),
        // buildBottomNavigationBarItem(
        //   'assets/Nav_bar_anamation/loc.json',
        //   'Location',
        // ),
        buildBottomNavigationBarItem(
          'assets/Nav_bar_anamation/chaat.json',
          'Chat',
        ),
        buildBottomNavigationBarItem(
          'assets/Nav_bar_anamation/not.json',
          'Notification',
        ),
        buildBottomNavigationBarItem(
          'assets/Nav_bar_anamation/setting.json',
          'Settings',
        ),
      ],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      String assetPath, String label) {
    return BottomNavigationBarItem(
      icon: Lottie.asset(
        assetPath,
        height: 40,
        width: 40,
      ),
      activeIcon: Lottie.asset(
        assetPath,
        height: 35,
        width: 35,
        animate: true,
      ),
      label: label,
      backgroundColor: defaultColor,
    );
  }
}

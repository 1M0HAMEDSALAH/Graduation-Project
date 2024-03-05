import 'package:flutter/material.dart';
import 'package:kidscontrol/modules/kids_control/Home/chat/chat_screen.dart';
import 'package:kidscontrol/modules/kids_control/Home/dashboard/dashboard_screen.dart';
import 'package:kidscontrol/modules/kids_control/Home/location/location_screen.dart';
import 'package:kidscontrol/modules/kids_control/Home/notification/notification_screen.dart';
import 'package:kidscontrol/modules/kids_control/Home/settings/settings_screen.dart';

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

/*appBar: AppBar(
        leading: Icon(
            Icons.menu
        ),
        backgroundColor: Colors.amber,
        title: Text(
            "WELCOME"
        ),
        actions: [
          Icon(Icons.notification_important),
          IconButton(onPressed: noti,
              icon:Icon( Icons.search))

        ],

      ),
      body:

      Container(
              color: Colors.white,
              width: double.infinity,  //ملئ الشاشه كلها
              padding: EdgeInsets.all(15.0),

               child:  Column(
                 //mainAxisSize: MainAxisSize.max,
               //  mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  /*Expanded(
                    child: Container(

                      color: Colors.red,
                      child: Text('AHMED',
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          )

                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      child: Text('EZZ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,


                        ),

                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.indigoAccent,
                      child: Text('ELDIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,


                        ),

                      ),
                    ),
                  ), */
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Stack(
                        alignment: Alignment.topLeft,

                        children: [
                         Image(
                            image: NetworkImage('https://th.bing.com/th/id/R.42502cc9e5df4e1d60c0b73b4fd90348?rik=ynXh9AZoC%2f7Nmg&pid=ImgRaw&r=0'),
                            fit: BoxFit.cover,
                            height: 650.0,
                            width:350.0 ,
                        ),

                          Container(
                            color: Colors.black.withOpacity(.3),
                            width: 200.0,
                            child: Text( 'SunFlower',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.amber,
                              ),
                              textAlign: TextAlign.center,

                            ),
                          ),
                        ],
                      ),
                    ),


                ]


              ),
            ),




    );



  void noti() {
    print ("hello");
  }  */

}
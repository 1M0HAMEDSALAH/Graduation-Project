import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:kidscontrol/modules/kids_control/device_apps/chat_screen.dart';
import 'package:kidscontrol/modules/kids_control/device_apps/help_screen.dart';
import 'package:kidscontrol/modules/kids_control/device_apps/notification_screen.dart';
import 'package:kidscontrol/shared/styles/colors.dart';
import 'package:usage_stats/usage_stats.dart';
import 'package:widget_loading/widget_loading.dart';
import 'appusage_screen.dart';



class DeviceApp extends StatefulWidget {
  const DeviceApp({super.key});

  @override
  State<DeviceApp> createState() => _DeviceAppState();
}
class _DeviceAppState extends State<DeviceApp> {

  List<UsageInfo> appUsage = [];

  @override
  void initState() {
    super.initState();
    getApps();
  }

  getApps() async {
    UsageStats.grantUsagePermission();
    bool isPermission = UsageStats.checkUsagePermission() as bool;
    List<Application> apps = await DeviceApps.getInstalledApplications(
      includeSystemApps: true,
      includeAppIcons: true,
      onlyAppsWithLaunchIntent: true,
    );
  }
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.blue);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                  border: Border()
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/img.png'),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text('Owais Mohamed',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            ListTile(
              hoverColor: Colors.grey,
              title: const Text(
                'App Usage',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  color: defaultColor,
                ),


              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const DeviceApp()));
              },
            ),
            ListTile(
              title: const Text(
                'Notification',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: defaultColor,
                ),

              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NotificationScreen()));
              },
            ),
            ListTile(
              title: const Text('Chat',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: defaultColor,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ChatScreen()));
              },
            ),
            const SizedBox(
              height: 220,
            ),
            const Divider(
              indent: 30,
              endIndent: 30,
            ),
            ListTile(
              title: const Row(
                children: [
                  Text(
                    'Help',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: defaultColor,
                    ),
                  ),
                 SizedBox(
                   width: 10,
                 ),
                  Icon(Icons.help,color:defaultColor,),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HelpScreen()),);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'Device App',
          style: TextStyle(
            color: defaultColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: ()=> Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const DeviceApp()), (route) => false),
        child: FutureBuilder(
          future: DeviceApps.getInstalledApplications(
            includeSystemApps: true,
            includeAppIcons: true,
            onlyAppsWithLaunchIntent: true,
          ),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Center(child: WiperLoading(child: LinearProgressIndicator(),),);
            }
            List<Application> apps = snapshot.data as List<Application>;
            return Container(
              height: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: apps.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AppUsage(application: apps[index])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        height: 50,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: ListTile(
                          leading: SizedBox(
                              height: 24,
                              child: Image.memory((apps[index] as ApplicationWithIcon).icon)),
                          title: Center(child: Text(apps[index].appName)),
                          trailing: const Text('Tap To Learn More'),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_apps/device_apps.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_Kid/laerning_side/Home.dart';
import 'package:usage_stats/usage_stats.dart';
import 'package:kidscontrol/shared/styles/colors.dart';
import 'package:widget_loading/widget_loading.dart';
import 'taskspage.dart';
import 'appusage_screen.dart';
import 'chat_screen.dart';
import 'help_screen.dart';
import 'notification_screen.dart';
import 'package:collection/collection.dart';
import 'package:geolocator/geolocator.dart';


class DeviceApp extends StatefulWidget {
  final datakid;
  const DeviceApp({Key? key, required this.datakid}) : super(key: key);

  @override
  State<DeviceApp> createState() => _DeviceAppState();
}

class _DeviceAppState extends State<DeviceApp> {


  @override
  void initState() {
    super.initState();
    getApps();
    // _locationkid();
  }


  getApps() async {
    UsageStats.grantUsagePermission();
    bool? isPermission = await UsageStats.checkUsagePermission();
    if (isPermission!) {
      List<Application> apps = await DeviceApps.getInstalledApplications(
        includeAppIcons: true,
        onlyAppsWithLaunchIntent: true,
      );

      getAppUsage(apps);
    }
  }

  getAppUsage(List<Application> apps) async {
    DateTime endDate = DateTime.now();
    DateTime startDate = DateTime(endDate.year, endDate.month, endDate.day, 0, 0, 0);

    List<UsageInfo> usageStats = await UsageStats.queryUsageStats(startDate, endDate);
    if (usageStats.isNotEmpty) {
      List<Map<String, dynamic>> appsData = [];
      apps.forEach((app) {
        UsageInfo? usageInfo = usageStats.firstWhereOrNull(
              (element) => element.packageName == app.packageName,
        );
        if(usageInfo?.totalTimeInForeground !=0)
          appsData.add({
            'AppName': app.appName,
            'AppPackageName': app.packageName,
            'AppTimeUse': usageInfo?.totalTimeInForeground ?? '0',
            'LastTimeUse': usageInfo?.lastTimeUsed ?? '0',
          });
      });
      _addAllAppsToFire(appsData);
    } else {
      // Handle case when usageStats is empty
      print("Usage stats is empty");
    }
  }

  _addAllAppsToFire(List<Map<String, dynamic>> appsData) async {
    await FirebaseFirestore.instance
        .collection('KidsSide')
        .doc(widget.datakid['Id'])
        .collection('AppsInfo')
        .doc('G3dFeGPoMNUFKu9iSvag')
        .set({
      'ApplicationsStatus':  appsData,
    }).then((value) => print("Apps added Or Updated to Firestore successfully"))
        .catchError((error) => print("Failed to add Or Updated apps: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
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
                      backgroundImage: NetworkImage(widget.datakid['Image']),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(widget.datakid['FirstName'],
                    style: TextStyle(
                      fontSize: 22,
                      color: defaultColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'default',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            ListTile(
              title: const Text(
                'Learning Space',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: defaultColor,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyHomePage()));
              },
            ),
            ListTile(
              title: const Text(
                'Tasks Space',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: defaultColor,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyTasksPage(id: widget.datakid,)));
              },
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        DeviceApp(datakid: widget.datakid,)));
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NotificationScreen()));
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  KidChatScreen(datakid:widget.datakid,)));
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
                  Icon(Icons.help, color: defaultColor,),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HelpScreen()),);
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
        onRefresh: () =>
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                builder: (context) => DeviceApp(datakid: widget.datakid,)),
                    (route) => false),
        child: FutureBuilder(
          future: DeviceApps.getInstalledApplications(
            includeAppIcons: true,
            onlyAppsWithLaunchIntent: true,
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: WiperLoading(child: LinearProgressIndicator(),),);
            }
            List<Application> apps = snapshot.data as List<Application>;
            _addAllAppsToFire(apps.cast<Map<String, dynamic>>());
            return Container(
              height: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: apps.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              AppUsage(application: apps[index])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: ListTile(
                          leading: SizedBox(
                              height: 24,
                              child: Image.memory(
                                  (apps[index] as ApplicationWithIcon).icon)),
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
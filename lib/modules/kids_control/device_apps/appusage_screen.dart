import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kidscontrol/shared/styles/colors.dart';
import 'package:usage_stats/usage_stats.dart';
import 'package:widget_loading/widget_loading.dart';

class AppUsage extends StatefulWidget {
  final Application application;
  const AppUsage({super.key, required this.application});

  @override
  State<AppUsage> createState() => _AppUsageState();
}

class _AppUsageState extends State<AppUsage> {

  UsageInfo? UsageApp;
  bool _isnull =  true ;

  getAppUsage() async {

    DateTime endDate = DateTime.now();
    DateTime startDate = DateTime(endDate.year, endDate.month, endDate.day, 0, 0, 0);

    List<UsageInfo> usageStats = await UsageStats.queryUsageStats(startDate, endDate);
    if(usageStats.isNotEmpty){
      usageStats.forEach((element) {
        if(element.packageName == widget.application.packageName){
          setState(() {
            UsageApp = element;
          });
        }
      });
      _isnull = false ;
    }
  }

  @override
  void initState() {
    getAppUsage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.application.appName,
         style: const TextStyle(
           color: defaultColor,
           fontWeight: FontWeight.bold,
         ),
        ),
      ),
      body: _isnull ? Center(child: WiperLoading(child: LinearProgressIndicator(),),)
      : Column(
        children: [
          Center(
            child:Container(
                height: 300,
                child: Image.asset("assets/images/Flying kite-amico.png")),
          ),
         const SizedBox(
            height:30 ,
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              decoration :  BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${(int.parse(UsageApp!.totalTimeInForeground!) / 1000 / 60).toStringAsFixed(2)}\nM:S" ,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: defaultColor,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text("last Time Used :",
                          style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: defaultColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(" ${DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(int.parse(UsageApp!.lastTimeUsed!)))}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: defaultColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("firstTimeStamp :",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: defaultColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(" ${DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(int.parse(UsageApp!.firstTimeStamp!)))}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: defaultColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
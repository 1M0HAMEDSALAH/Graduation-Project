import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:KidsMonitorAndLearning/modules/Kids_Monitoring_learning_parent/Home/dashboard/tracking_selected_kid.dart';
import 'package:KidsMonitorAndLearning/shared/styles/colors.dart';

class KidScrenen extends StatefulWidget {
  final KidsName;
  final ForMoreInfo;
  const KidScrenen({super.key, required this.KidsName, required this.ForMoreInfo});

  @override
  State<KidScrenen> createState() => _KidScrenenState();
}

class _KidScrenenState extends State<KidScrenen> {


  static const TextStyle optionStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: defaultColor,
    fontFamily: 'default',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: defaultColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          widget.KidsName,
          style: optionStyle,
        ),
        actions: [
          IconButton(
              onPressed: ()
              {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => TrackingKid(dataselectedkid: widget.ForMoreInfo,)));
              },
              icon: Icon(Icons.location_on_outlined , color: defaultColor,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.ForMoreInfo['Image']),
                      radius: 70,
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text('ID : ${widget.ForMoreInfo['Id']}', style: optionStyle),
                        Text(widget.ForMoreInfo['FirstName'], style: optionStyle),
                        Text(widget.ForMoreInfo['LastName'], style: optionStyle),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 8),
              Divider(
                thickness: 5,
                endIndent: 100,
                indent: 100,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: IconButton(
              //         onPressed: () {
              //           showDialog(
              //             context: context,
              //             builder: (BuildContext context) {
              //               return AlertDialog(
              //                 title: Text('Block App'),
              //                 content: Text('We Are Sorry This Feature Not Implement Yet.'),
              //                 actions: <Widget>[
              //                   TextButton(
              //                     onPressed: () {
              //                       Navigator.of(context).pop();
              //                     },
              //                     child: Text('Close'),
              //                   ),
              //                 ],
              //               );
              //             },
              //           );
              //         },
              //         icon: Icon(Icons.block, color: defaultColor, size: 50),
              //       ),
              //     ),
              //     Expanded(
              //       child: IconButton(
              //         onPressed: () {
              //           showDialog(
              //             context: context,
              //             builder: (BuildContext context) {
              //               return AlertDialog(
              //                 title: Text('schedule Screen Time'),
              //                 content: Text('We Are Sorry This Feature Not Implement Yet.'),
              //                 actions: <Widget>[
              //                   TextButton(
              //                     onPressed: () {
              //                       Navigator.of(context).pop();
              //                     },
              //                     child: Text('Close'),
              //                   ),
              //                 ],
              //               );
              //             },
              //           );
              //         },
              //         icon: Icon(Icons.schedule, color: defaultColor, size: 50),
              //       ),
              //     ),
              //   ],
              // ),
              // Divider(
              //   indent: 14,
              //   endIndent: 14,
              // ),
              Expanded(
                child: Center(
                  child: FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('KidsSide')
                        .doc(widget.ForMoreInfo['Id'])
                        .collection('AppsInfo')
                        .doc('G3dFeGPoMNUFKu9iSvag')
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      if (!snapshot.hasData) {
                        return Text('No Data');
                      }

                      List<dynamic> applicationsStatus = snapshot.data!['ApplicationsStatus'];

                      if(applicationsStatus.isEmpty)
                      {
                        return Center(child: CircularProgressIndicator());
                      }
                      else{
                        return ListView.builder(
                          itemCount: applicationsStatus.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> appData = applicationsStatus[index];
                            String appName = appData['AppName'];
                            //String appPackageName = appData['AppPackageName'];
                            String appTimeUse = appData['AppTimeUse'];
                            String lastTimeUse = appData['LastTimeUse'];

                            // if((int.parse(appTimeUse) > 0)

                            return ListTile(
                              title: Text(
                                appName,
                                style: TextStyle(
                                  color: defaultColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text('Time Use :  ${(int.parse(appTimeUse) / 1000 / 60).toStringAsFixed(2)} Minutes\nLast Time Use: ${DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(int.parse(lastTimeUse)))}'),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 12,),
            ],
          ),
        ),
      ),
    );
  }
}
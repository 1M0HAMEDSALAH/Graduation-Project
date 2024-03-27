import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_parent/Home/dashboard/addkid.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_parent/Home/dashboard/slectedkidscreen.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_parent/Home/homepage.dart';
import 'package:kidscontrol/shared/styles/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Dashboard extends StatefulWidget {


  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  List<QueryDocumentSnapshot> KidInfo = [];

  _Getkids()async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("KidsSide")
        .where("Uid" ,isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    KidInfo.addAll(querySnapshot.docs);
    setState(() {});
  }

  static const TextStyle optionStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: defaultColor,
    fontFamily: 'default',
  );

  @override
void initState() {
  _Getkids();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const AddKid()));
        },
        child:const Icon(
          Icons.add,
          color: Colors.white,
          size: 34,
        ),
        backgroundColor: Colors.indigoAccent,
        shape: const CircleBorder(),
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: EdgeInsets.only(left: 15.0, top: 30.0),
              child: Row(
                children: [
                  Text('Hello',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                      color: defaultColor,
                      fontFamily: 'default',
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Image.asset(
                    'assets/images/hello.png',
                    width: 70.0,
                    height: 60.0,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text('My Children',
                style: TextStyle(
                  fontSize: 30.0,
                  color: defaultColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'default',
                ),
              ),
            ),
            const SizedBox(
              height: 2.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('Choose child to get more info',
                style: TextStyle(
                  fontFamily: 'default',
                  fontSize: 16.0,
                  color: Colors.grey.withOpacity(.5),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              width: size.width,
              height: size.height *0.22,
              child: ListView.builder(
                itemCount: KidInfo.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context , index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onLongPress: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Delete Kid'),
                                content: Text('Are You Sure To Delete Your Kid.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: ()async {
                                      await FirebaseFirestore.instance.collection('KidsSide').doc(KidInfo[index].id).delete();
                                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> HomePage()), (route) => false);},
                                    child: Text('Delete anyway😞'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> KidScrenen(ForMoreInfo: KidInfo[index],KidsName: KidInfo[index]['FirstName'],)));
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(KidInfo[index]['Image']),
                            ),
                            SizedBox(height: 8,),
                            Text(KidInfo[index]['FirstName'],style: optionStyle,),
                          ],
                        ),
                      ),
                    );
                  },
              ),
            ),
            SizedBox(height: 24,),
            Container(
              width: double.infinity,
              height: 200,
              child: CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 5.0,
                percent: .9,
                center: new Text("90%"),
                progressColor: Colors.green,
              ),
            ),
          ],
              ),
        ),
      );
  }
}
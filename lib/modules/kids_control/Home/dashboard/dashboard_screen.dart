import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidscontrol/modules/kids_control/Home/dashboard/addkid.dart';
import 'package:kidscontrol/modules/kids_control/Home/dashboard/slectedkidscreen.dart';
import 'package:kidscontrol/shared/styles/colors.dart';

class Dashboard extends StatefulWidget {


  @override
  State<Dashboard> createState() => _DashboardState();
}

List<double> weeklytime = [
  18.2,
  20.2,
  12.2,
  10.2,
  22.2,
  45.2,
];


class _DashboardState extends State<Dashboard> {
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
        body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0, top: 30.0),
            child: Row(
              children: [
                Text('Hello',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                    color: defaultColor,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Image(
                  image: NetworkImage('https://th.bing.com/th/id/R.10d95090747c718af42e3ecde50ffb7b?rik=MOJ4EL7kkY930w&pid=ImgRaw&r=0'),
                  width: 70.0,
                  height: 70.0,
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
              itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context , index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> KidScrenen(KidsName: 'Mohamed salah',)));
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage('https://st4.depositphotos.com/13108546/39498/i/450/depositphotos_394983578-stock-photo-smiling-redhead-boy-close-up.jpg'),
                          ),
                          SizedBox(height: 8,),
                          Text("name of kid")
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
            child: BarChart(
              BarChartData(
                minY: 0.0,
                maxY: 100.0,
              ),
            swapAnimationDuration: Duration(milliseconds: 150),
            swapAnimationCurve: Curves.linear,
            ),
          ),
        ],
            ),
      );
  }
}
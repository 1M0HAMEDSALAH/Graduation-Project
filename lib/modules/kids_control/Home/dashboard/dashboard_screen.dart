import 'package:flutter/material.dart';
import 'package:kidscontrol/shared/styles/colors.dart';

class Dashboard extends StatefulWidget {


  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 34,
        ),
        backgroundColor: Colors.indigoAccent,
        shape: CircleBorder(),
      ),
        body: Column(
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
                    fontSize: 55.0,
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
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text('My Children',
              style: TextStyle(
                fontSize: 30.0,
                color: defaultColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 2.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text('Choose child to get more info',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey.withOpacity(.5),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.indigo,
                      width: 3.0,
                    ),

                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image(
                    image: NetworkImage('https://th.bing.com/th/id/R.53b3f36c6c0c68e0720ed40fcc37b781?rik=PA3fykNOBcbXYA&riu=http%3a%2f%2f4.bp.blogspot.com%2f-LBTpPgXexBM%2fTpTq_4uJuhI%2fAAAAAAAACl8%2fZZczMDdf40w%2fs1600%2f058.JPG&ehk=7pkhJ2%2bQ6i1m6j0nCnJ5c79pu2dAWOShWOz38fxeMbw%3d&risl=&pid=ImgRaw&r=0'),
                    fit: BoxFit.fill,
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
              ),

              SizedBox(
                width: 20.0,
              ),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.indigo,
                    width: 3.0,
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                  image: NetworkImage('https://accesspsychology.ca/wp-content/uploads/2020/03/early.jpg'),
                  fit: BoxFit.fill,
                  width: 100.0,
                  height: 100.0,
                ),
              ),

            ],
          )

        ],
            ),
      );
  }
}
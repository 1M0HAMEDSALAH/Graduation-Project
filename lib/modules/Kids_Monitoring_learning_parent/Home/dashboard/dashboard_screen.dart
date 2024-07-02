import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_parent/Home/dashboard/addkid.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_parent/Home/dashboard/slectedkidscreen.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_parent/Home/homepage.dart';
import 'package:kidscontrol/shared/styles/colors.dart';


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

  _AddDataTasksToFirebase()async {
    await FirebaseFirestore.instance
        .collection('TasksSide')
        .add({
      'Task Name' : Taskcontrl.text ,
      'Task Time' : Timecontrl.text ,
      'Task Date' : Datecontrl.text ,
      'id' : idcontrl.text,
    });
  }

  static const TextStyle optionStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: defaultColor,
    fontFamily: 'default',
  );

  var Formkey = GlobalKey<FormState>();
  var Taskcontrl = TextEditingController();
  var Timecontrl = TextEditingController();
  var Datecontrl = TextEditingController();
  var idcontrl = TextEditingController();

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
          FontAwesomeIcons.plus,
          color: Colors.white,
          size: 34,
        ),
        backgroundColor: defaultColor,
        shape: const CircleBorder(),
      ),
        body: SingleChildScrollView(
          child: Padding(
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
                                      child: Text('Delete anyway '),
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
              Container(
                width: double.infinity,
                height: 550,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white.withOpacity(.1),
                ),
                child: Form(
                  key: Formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Assign Tasks For Your Kids',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: defaultColor,
                          fontFamily: 'default',
                        ),
                      ),
                      SizedBox(height: 24,),
                      TextFormField(
                        controller: idcontrl,
                        keyboardType: TextInputType.text,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'The ID Of The Target Kid Cant be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Type The ID Of The Target Kid',
                          prefixIcon: const Icon(Icons.perm_identity),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                      SizedBox(height: 24,),
                      TextFormField(
                        controller: Taskcontrl,
                        keyboardType: TextInputType.name,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'The Title Cant be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Task Title',
                          prefixIcon: const Icon(Icons.task),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                      const SizedBox(height: 24,),
                      TextFormField(
                        controller: Timecontrl,
                        keyboardType: TextInputType.datetime,
                        onTap: (){
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then(
                                  (value) => Timecontrl.text = value!.format(context).toString());
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return 'The Time Cant be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Task Time',
                          prefixIcon: const Icon(Icons.watch_later_outlined),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                      const SizedBox(height: 24,),
                      TextFormField(
                        controller: Datecontrl,
                        onTap: (){
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.parse('2030-05-03'),
                          ).then(
                                  (value) {
                                Datecontrl.text = DateFormat.yMMMd().format(value!);
                              }
                          );
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return 'The Date Cant be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Date Time',
                          prefixIcon: const Icon(Icons.date_range),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                      const SizedBox(height: 24,),
                      Center(
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration:  BoxDecoration(
                            color: defaultColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: MaterialButton(
                            child: const Text(
                              'Add Task For All Kids',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                              ),
                            ),
                            onPressed: ()async {
                              if(Formkey.currentState!.validate())
                              {
                                await _AddDataTasksToFirebase();
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> HomePage() ), (route) => false);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            ),
          ),
        ),
      );
  }
}
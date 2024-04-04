import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kidscontrol/shared/styles/colors.dart';
import 'package:widget_loading/widget_loading.dart';
import '../device_apps/deviceapps_screen.dart';

class ChildSideScreen extends StatefulWidget {
  const ChildSideScreen({Key? key}) : super(key: key);

  @override
  State<ChildSideScreen> createState() => _ChildSideScreenState();
}

class _ChildSideScreenState extends State<ChildSideScreen> {

  var formkey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController idController = TextEditingController();

  bool _isNull = false;

  double? long;
  double? late;

  Future _locationkid() async {
    bool ServiceOn;
    LocationPermission permission;
    ServiceOn = await Geolocator.isLocationServiceEnabled();
    if (!ServiceOn) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Location 🤦‍♂️'),
            content: Text('Make Sure The Location Service Is On.'),
          );
        },
      );
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return print('==========================');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Location 🤦‍♂️'),
            content: Text("You Can't Accesses To Kid Location ."),
          );
        },
      );
    }
    if(permission == LocationPermission.whileInUse){
      Position position = await Geolocator.getCurrentPosition();
      print('============================================');
      print(position.longitude);
      print(position.latitude);
      print('============================================');
      long = position.longitude;
      late = position.latitude;
    }
  }

  @override
  void initState() {
    _locationkid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Kids side",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: defaultColor,
            fontFamily: 'Default',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: _isNull
                ? Center(
              child: WiperLoading(
                child: LinearProgressIndicator(),
              ),
            )
                : Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: Container(
                      height: 220,
                      child: Image.asset("assets/images/Flying kite-amico.png")),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: usernameController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'The Password Must Not Be Empty';
                      }
                      return null;
                    },
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: '  User Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: idController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'The Password Must Not Be Empty';
                      }
                      return null;
                    },
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: const InputDecoration(
                      labelText: 'ID',
                      hintText: ' Child ID',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: 300,
                  height: 43,
                  decoration: BoxDecoration(
                    color: defaultColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    onPressed: ()async {
                      var res=await FirebaseFirestore.instance
                          .collection('KidsSide')
                          .doc(idController.text).get();
                      await FirebaseFirestore
                          .instance
                          .collection('KidsSide')
                          .doc(idController.text)
                          .set({
                        'long' : long,
                        'late' : late,
                      },
                      SetOptions(merge: true),
                      );
                      if (res.exists) {
                        if (formkey.currentState!.validate()) {
                          if (res['Id'].toString() == idController.text) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => DeviceApp(datakid: res,)),
                                    (route) => false);
                          } else {
                            Fluttertoast.showToast(
                              msg: "The Username Or Id is Wrong",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          }
                        } else {
                          Fluttertoast.showToast(
                            msg: "Validation Required",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      }
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kidscontrol/shared/styles/colors.dart';
import 'package:latlong2/latlong.dart';
import 'package:widget_loading/widget_loading.dart';

class Location extends StatefulWidget {


  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {


  List<Map<String, dynamic>> profileData = [];
  bool _IsNull = true ;


  readData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('KidsSide')
        .where('Uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    profileData = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    _IsNull = false ;
    setState(() {});
  }

  @override
  void initState() {
    readData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
          options: MapOptions(
            zoom: 15,
            maxZoom: 50,
            center: LatLng(profileData.isNotEmpty ? profileData[0]['late'] : 31.490392, profileData.isNotEmpty ? profileData[0]['long'] : 31.490392),
          ),
        children: <Widget>[
          TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
          ),
           MarkerLayer(
            markers: [
              Marker(
                point: LatLng(profileData.isNotEmpty ? profileData[0]['late'] : 31.490392, profileData.isNotEmpty ? profileData[0]['long'] : 31.490392),
                width: 80,
                height: 80,
                child: IconButton(
                    onPressed: (){
                      _displayDialogLocation(context);
                    },
                    icon: const Icon(Icons.location_on,color: defaultColor,size: 35,),
                ),
              ),
            ],
          ),
  ],
    ),
    );
  }

Future _displayDialogLocation(BuildContext context){
    return showModalBottomSheet(
        context: context,
        builder: (context) => _IsNull ? Center(
          child: WiperLoading(
            child: LinearProgressIndicator(),
          ),
        )
            : Container(
          width: double.infinity,
          height: 350,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12,),
                Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:  const Color.fromRGBO(217, 217, 217, 1),
                          borderRadius: BorderRadius.circular(50)
                        ),
                        width: 40,
                        height: 12,
                      ),
                      const Divider(
                        endIndent: 20,
                        indent: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12,),
                Text('ID',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: defaultColor),),
                Text('${profileData.isNotEmpty ? profileData[0]['Id'] : 'Not Set'}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),),
                SizedBox(height: 12,),
                Text('Address Kid',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: defaultColor),),
                Text('Zagazig - Elgasham Street',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),),
                SizedBox(height: 12,),
                Text('Kid Name',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: defaultColor),),
                Text('${profileData.isNotEmpty ? profileData[0]['FirstName'] : 'Not Set'}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),)
              ],
            ),
          ),
        ));
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kidscontrol/shared/styles/colors.dart';
import 'package:latlong2/latlong.dart';

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
          options: const MapOptions(
              zoom: 15,
            maxZoom: 50,
            center: LatLng(30.596898, 31.490392),
          ),
        children: <Widget>[
      TileLayer(
      urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
        subdomains: const ['a', 'b', 'c'],
      ),
           MarkerLayer(
            markers: [
              Marker(
                point: const LatLng(30.596898, 31.490392),
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
        builder: (context) => Container(
          width: double.infinity,
          height: 350,
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12,),
                Center(
                  child: Divider(
                    endIndent: 150,
                    thickness: 12,
                    indent: 150,
                  ),
                ),
                SizedBox(height: 12,),
                Text('ID',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: defaultColor),),
                Text('AS3G35',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),),
                SizedBox(height: 12,),
                Text('Address Kid',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: defaultColor),),
                Text('Zagazig - Elgasham Street',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),),
                SizedBox(height: 12,),
                Text('Kid Name',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: defaultColor),),
                Text('Owais Mohamed',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),)
              ],
            ),
          ),
        ));
  }

}
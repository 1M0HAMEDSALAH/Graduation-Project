import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kidscontrol/shared/styles/colors.dart';
import 'package:latlong2/latlong.dart';

class TrackingKid extends StatefulWidget {
  final dataselectedkid ;
  const TrackingKid({super.key, required this.dataselectedkid});

  @override
  State<TrackingKid> createState() => _TrackingKidState();
}

class _TrackingKidState extends State<TrackingKid> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: FlutterMap(
              options: MapOptions(
                zoom: 15,
                maxZoom: 50,
                center: LatLng(widget.dataselectedkid['late'] , widget.dataselectedkid['long']),
              ),
            children: <Widget>[
              TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
               MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(widget.dataselectedkid['late'] , widget.dataselectedkid['long']),
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
                Text('${widget.dataselectedkid['Id']}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),),
                SizedBox(height: 12,),
                Text('Address Kid',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: defaultColor),),
                Text('Not Defined',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),),
                SizedBox(height: 12,),
                Text('Kid Name',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: defaultColor),),
                Text('${widget.dataselectedkid['FirstName']}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),)
              ],
            ),
          ),
        ));
  }
}
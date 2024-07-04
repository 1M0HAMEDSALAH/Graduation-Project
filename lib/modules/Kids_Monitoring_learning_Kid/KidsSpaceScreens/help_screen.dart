import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:KidsMonitorAndLearning/shared/styles/colors.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {


  Future _locationkid() async {
    bool ServiceOn;
    ServiceOn = await Geolocator.isLocationServiceEnabled();
    print(ServiceOn);
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
          "Help",
          style:  TextStyle(
            color: defaultColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('For Help Ask ChatGPT 😁',style: TextStyle(fontSize: 50),),
          ),
        ],
      ),
    );
  }
}

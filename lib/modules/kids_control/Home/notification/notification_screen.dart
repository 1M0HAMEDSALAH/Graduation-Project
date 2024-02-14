import 'package:flutter/material.dart';

class Noti extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text('Notification',
        style: TextStyle(
          color: Colors.black,
          fontSize: 40.0,
        ),

      ),
    );
  }
}
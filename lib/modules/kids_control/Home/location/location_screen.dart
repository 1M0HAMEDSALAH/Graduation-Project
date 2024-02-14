import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text('location',
        style: TextStyle(
          color: Colors.black,
          fontSize: 40.0,
        ),
      ),
    );
  }
}
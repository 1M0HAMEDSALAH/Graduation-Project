import 'package:flutter/material.dart';

import '../../../../shared/styles/colors.dart';

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "location",
          style:  TextStyle(
            color: defaultColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
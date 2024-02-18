import 'package:flutter/material.dart';

import '../../../../shared/styles/colors.dart';

class Noti extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Notification",
          style:  TextStyle(
            color: defaultColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
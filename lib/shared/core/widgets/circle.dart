import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    super.key,
    required this.circleSize,
    required this.borderSize,
  });
  final double circleSize;
  final double borderSize;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: circleSize,
      backgroundColor: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: ClipOval(
          child: SizedBox.fromSize(
            size: Size.fromRadius(borderSize),
            child: Image.asset(
              "assets/images/jj.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

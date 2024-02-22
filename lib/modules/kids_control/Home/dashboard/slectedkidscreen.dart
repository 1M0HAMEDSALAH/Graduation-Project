import 'package:flutter/material.dart';

class KidScrenen extends StatefulWidget {
  final KidsName ;
  const KidScrenen({super.key, required this.KidsName});

  @override
  State<KidScrenen> createState() => _KidScrenenState();
}

class _KidScrenenState extends State<KidScrenen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.KidsName),
      ),
      body: Column(
        children: [
          Center(child: Text('Mohamed salah'),),
        ],
      ),
    );
  }
}

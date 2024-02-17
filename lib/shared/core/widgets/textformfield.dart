import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFiled extends StatelessWidget {
  final String hint;

  TextFormFiled({
    super.key,
    required this.hint,
  });

  Color w = Colors.white;
  Color b = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: b,
      decoration: InputDecoration(
        focusColor: b,
        hintText: " Message",
        hintStyle: TextStyle(fontSize: 13),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: Colors.grey,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: b,
            )),
      ),
    );
  }
}

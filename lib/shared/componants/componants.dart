import 'package:flutter/material.dart';
import 'package:kidscontrol/shared/styles/colors.dart';

Widget defultButton({
  Color background = defaultColor,
  required String text,
  required Function function,
  double width =100,
  bool isLowerCase = true,
  double radius = 10.0,

}) => Container(
  width: 200,
  height: 60,
  decoration:  BoxDecoration(
    color: background,
    borderRadius: BorderRadius.circular(radius),
  ),
  child: MaterialButton(
    onPressed:function(),
    child: Text(
     isLowerCase ? text.toLowerCase() : text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold
      ),
    ) ,
  ),
);


Widget defultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required String hint,
  required IconData prefix,

})
=> TextFormField(
obscureText: true,
controller: controller,
keyboardType: type,
decoration: InputDecoration(
prefixIcon: Icon(
    prefix,
),
labelText: label,
hintText: hint,
border: OutlineInputBorder(),



),
);



void navigateAndFinish(
context,
widget,
) =>
    Navigator.pushAndRemoveUntil(
        context,
       MaterialPageRoute(
     builder: (context)=> widget,
     ),
     ( route)
      {
     return false;
      }
     );

void navigateTo(context ,
    widget,
    ) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context)=> widget,
),
);










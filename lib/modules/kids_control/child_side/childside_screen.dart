import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidscontrol/shared/styles/colors.dart';

class ChildSideScreen extends StatefulWidget {
  const ChildSideScreen({super.key});

  @override
  State<ChildSideScreen> createState() => _ChildSideScreenState();
}

class _ChildSideScreenState extends State<ChildSideScreen> {

  var formkey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController idController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SafeArea(
                  child: Text("Kids side ",
                    style: TextStyle(
                        color: defaultColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'default',
                    ),
                  ),
                ),
                SizedBox(height: 100,),
                Center(
                  child: Container(
                      height: 220,
                      child: Image.asset("assets/images/Flying kite-amico.png")),
                ),
                TextFormField(
                  controller: usernameController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'The Password Must Not Be Empty';
                    }
                    return null;
                  },
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: '  User Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12,),
                TextFormField(
                  controller: idController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'The Password Must Not Be Empty';
                    }
                    return null;
                  },
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'ID',
                    hintText: ' Child ID',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 25,),
                Container(
                  width: 300,
                  height: 43,
                  decoration:  BoxDecoration(
                    color: defaultColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    onPressed: (){
                      if(formkey.currentState!.validate()){
                        print(usernameController.text);
                        print(idController.text);
                        Fluttertoast.showToast(
                            msg: "Welcome ${usernameController.text}",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: defaultColor,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                      else{
                        Fluttertoast.showToast(
                            msg: "validate Require",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    },
                    child: Text(
                      'SignIn',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

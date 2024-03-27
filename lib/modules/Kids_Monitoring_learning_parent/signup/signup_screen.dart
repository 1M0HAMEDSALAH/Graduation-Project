import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:icon_icons/icon_icons.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_parent/Home/homepage.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_parent/login/login_screen.dart';
import 'package:kidscontrol/shared/styles/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  _addUser()async {
    return await FirebaseFirestore
        .instance
        .collection('Parents')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'Name': nameController.text,
      'Email': emailController.text,
      'Password': passwordController.text ,
      'Phone': PhoneController.text,
      'BD': '9-9-9999',
      'Uid': FirebaseAuth.instance.currentUser!.uid ,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var PhoneController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool _IsShow =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: defaultColor,
            fontFamily: 'Default',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/Sign up-rafiki.png',
                  width: 182,
                  height: 182,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'The EmailAddress Must Contain @';
                      }
                      return null;
                    },
                    onFieldSubmitted: ( String value){
                      print(value);
                    },
                    onChanged: ( String value){
                      print(value);
                    },
                    decoration:const  InputDecoration(
                      prefixIcon: Icon(
                          Icons.email_outlined
                      ),
                      labelText: 'Email',
                      hintText: ' enter your email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'The name Must Not Be Empty';
                      }
                      return null;
                    },
                    onFieldSubmitted: ( String value){
                      print(value);
                    },
                    onChanged: ( String value){
                      print(value);
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                          Icons.person
                      ),
                      labelText: 'Name',
                      hintText: ' User Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    obscureText: _IsShow,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'The Password Must Not Be Empty';
                      }
                      return null;
                    },
                    onFieldSubmitted: ( String value){
                      print(value);

                    },
                    onChanged: ( String value){
                      print(value);

                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                          Icons.lock
                      ),
                      suffixIcon:IconButton(
                        onPressed: (){
                          setState(() {
                            _IsShow = !_IsShow;
                          });
                        },
                        icon: _IsShow ? const Icon(
                          Icons.visibility_off,
                        )
                            : const Icon(Icons.visibility),
                      ),
                      labelText: 'Password',
                      hintText: ' enter your password',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: PhoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'The phone Must Not Be Empty';
                      }
                      return null;
                    },
                    onFieldSubmitted: ( String value){
                      print(value);

                    },
                    onChanged: ( String value){
                      print(value);

                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                          Icons.phone_android,
                      ),
                      labelText: 'Phone Number',
                      hintText: '+201094542564',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 300,
                  height: 43,
                  decoration:  BoxDecoration(
                    color: defaultColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    onPressed: (){
                      _SignupAuth();
                      _showToast(context);
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Default',
                      ),
                    ),
                  ),
                ),
                const SizedBox (
                  height: 12,
                ),
                const Row(
                  children: [
                    Expanded(child: Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),),
                    Text("Or Continue With"),
                    Expanded(child: Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          _signInWithFacebook();
                        },
                        icon:
                        IconIcons.facebook(
                          width: 40.0,
                          height: 40.0,
                        )
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    TextButton(
                      onPressed: () {
                        _signInWithGoogle();
                      },
                      child: Image.asset('assets/images/GoogleIcon.png',width: 45.0,height: 45.0,),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _SignupAuth()async {
    if(formkey.currentState!.validate()){
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text,
        );
        FirebaseAuth.instance.currentUser!.sendEmailVerification();
        _addUser();
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginScreen()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          Fluttertoast.showToast(
              msg: "The password provided is too weak.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          Fluttertoast.showToast(
              msg: "The account already exists for that email.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      } catch (e) {
        print(e);
      }
    }
  }

  void _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()) ,(route) => false,);
  }

  void _signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()) ,(route) => false,);
  }


void _showToast(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('The Account Created Successfully'),
      action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

}

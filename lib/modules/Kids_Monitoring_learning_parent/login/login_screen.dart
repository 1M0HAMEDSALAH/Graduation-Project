import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:icon_icons/icon_icons.dart';
import 'package:KidsMonitorAndLearning/modules/Kids_Monitoring_learning_parent/Home/homepage.dart';
import 'package:KidsMonitorAndLearning/modules/Kids_Monitoring_learning_parent/login/forget_password.dart';
import 'package:KidsMonitorAndLearning/modules/Kids_Monitoring_learning_parent/signup/signup_screen.dart';
import 'package:KidsMonitorAndLearning/shared/styles/colors.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  var formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _IsShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text(
          "Sign In",
          style: TextStyle(
            // shadows: [
            //   Shadow(
            //     color: Colors.black38,
            //     offset: Offset(2.0, 2.0),
            //   ),
            // ],
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: defaultColor,
            fontFamily: 'Default',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 149,
              width: 218,
              decoration:const  BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/Login-rafiki.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
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
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        onChanged: (String value) {
                          print(value);
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                          ),
                          labelText: 'Email',
                          hintText: ' enter your email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        onChanged: (String value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
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
                          prefixIcon: const Icon(
                            Icons.lock,
                          ),
                          labelText: 'Password',
                          hintText: ' enter your password',
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ForgetPassword()));
                          },
                          child:const Text(
                            " Forget Password ?",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: defaultColor,
                              color:defaultColor,
                              fontFamily: 'Default',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      decoration:  BoxDecoration(
                        color: defaultColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                        onPressed: (){
                          _SigninAuth();
                        },
                        child:const Text('Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),),
                      ),
                    ),
                    const SizedBox(
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
                      height: 15,
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
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have account ?",
                        ),
                        TextButton(onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const SignUpScreen()));
                        },
                          child:const Text(
                            "Register now",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: defaultColor,
                              color:defaultColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//Firebase Space
  void _SigninAuth() async {
    if(formkey.currentState!.validate()){
      try {
        var credential = await FirebaseAuth
            .instance
            .signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text,
        );
        if(credential.user!.emailVerified){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()) ,(route) => false,);
          _showToast(context);
        }else{
          Fluttertoast.showToast(
              msg: "Email Address Must Verified..",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          Fluttertoast.showToast(
              msg: "No user found for that email..",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          Fluttertoast.showToast(
              msg: "Wrong password provided for that user.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      }catch(e){
        Fluttertoast.showToast(
            msg: "${e.toString()}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }
  }

  void _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    if(googleUser == null){
      return;
    }

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
        content: const Text('SignIn Successfully'),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

}

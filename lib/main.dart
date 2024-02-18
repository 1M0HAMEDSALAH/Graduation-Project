import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidscontrol/modules/kids_control/Home/homepage.dart';
import 'package:kidscontrol/modules/kids_control/on_boarding/onboarding_screen.dart';
import 'package:kidscontrol/shared/styles/colors.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme:  ThemeData.dark(),
      themeMode:  ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser != null &&
          FirebaseAuth.instance.currentUser!.emailVerified)
          ? HomePage()
          : const Splach(),
    );
  }
}


class Splach extends StatefulWidget {
  const Splach({super.key});

  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  void initState(){
    super.initState();
    Future.delayed( const Duration(seconds: 3),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> const OnBoardingScreen()));
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              child: Image.asset('assets/images/splach1.jpg',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Kids Control",
            style: TextStyle(
              color:defaultColor,
              fontSize: 35,
              fontWeight:FontWeight.bold,
              fontFamily: 'Default',
            ),
            ),
          ],
        ),
      ),
    );
  }
}

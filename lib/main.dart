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
          : const Splash(),
    );
  }
}


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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
              width: 250,
              height: 250,
              child: Image.asset('assets/images/Family-pana.png',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Kids Control",
            style: TextStyle(
              color:defaultColor,
              fontSize: 30,
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

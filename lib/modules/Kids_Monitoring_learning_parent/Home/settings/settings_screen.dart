import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_parent/Home/settings/contact_Us.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_parent/Home/settings/privacy.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_parent/Home/settings/profile_setting.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_parent/login/login_screen.dart';
import 'package:kidscontrol/shared/styles/colors.dart';


class Settings extends StatefulWidget {

  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: defaultColor);


  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings',
          style: TextStyle(
            color: defaultColor,
            fontSize: 25.0,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Profile',
              style: Settings.optionStyle,
            ),
            const SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Profile()));
              },
              child: Container(
                width: double.infinity,
                height: 50,
                child: const Row(
                  children: [
                    Icon(Icons.update,color: defaultColor,),
                    SizedBox(width: 8,),
                    Text(
                      'Update Profile',
                      style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      fontFamily: 'default'
                    ),),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: defaultColor,),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: (){
                    showDialog(
                    context: context,
                    builder: (BuildContext context) {
                    return AlertDialog(
                        title: Text('Change Language'),
                        content: Text('We Are Sorry This Feature Not Implement Yet.'),
                        actions: <Widget>[
                        TextButton(
                        onPressed: () {
                            Navigator.of(context).pop();
                            },
                        child: Text('Close'),
                        ),
                        ],
                    );
                  },
                );
              },
              child: Container(
                width: double.infinity,
                height: 50,
                child: const Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.language,
                      color: defaultColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Change Language',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        fontFamily: 'default'
                    ),),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: defaultColor,),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'privacy',
              style: Settings.optionStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Privacy()));
              },
              child: Container(
                width: double.infinity,
                height: 50,
                child: const Row(
                  children: [
                    Icon(Icons.privacy_tip,color: defaultColor,),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        fontFamily: 'default'
                    ),),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: defaultColor,),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: (){
                _displayDialogTerms(context);
              },
              child: Container(
                width: double.infinity,
                height: 50,
                child: const Row(
                  children: [
                    Icon(Icons.person_3_outlined,color: defaultColor,),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Terms and Conditions',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        fontFamily: 'default'
                    ),),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: defaultColor,),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Get Us',
              style: Settings.optionStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ContactUs()));
              },
              child: Container(
                width: double.infinity,
                height: 50,
                child: const Row(
                  children: [
                    Icon(Icons.question_mark_sharp,color: defaultColor,),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Contact Us',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        fontFamily: 'default'
                    ),),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: defaultColor,),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: Container(
                width: 300,
                height: 43,
                decoration:  BoxDecoration(
                  color: defaultColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MaterialButton(
                  onPressed: ()async {
                    await FirebaseAuth.instance.signOut();
                    GoogleSignIn googlesignin = GoogleSignIn();
                    googlesignin.disconnect();
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
                  },
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Default',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future _displayDialogTerms(BuildContext context){
    return showModalBottomSheet(
        context: context,
        builder: (context) =>
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height*0.8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12,),
                    Center(
                      child: Column(
                        children: [
                          Text('Terms'),
                          Divider(
                            endIndent: 20,
                            indent: 20,
                          ),
                          Expanded(
                            child: Text('- A lot of Words :)'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}


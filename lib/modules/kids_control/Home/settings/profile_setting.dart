import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kidscontrol/modules/kids_control/Home/settings/update_profile.dart';
import 'package:kidscontrol/shared/styles/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  void initState() {
    readData();
    super.initState();
  }
  String _email = '......';
  String _name = '.......';
  String _phone = '......';
  String _pass = '......';

  void readData() async {
    await FirebaseFirestore.instance
        .collection('Parents')
        .where('Uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
        String email = userData['Email'];
        String user_name = userData['Name'];
        String phone = userData['Phone'];
        String passwoed = userData['Password'];

        setState(() {
          _email = email;
          _name = user_name;
          _phone = phone;
          _pass = passwoed;
        });
      });
    }).catchError((e) {
      print('Error getting documents: $e');
    });
  }

  static const TextStyle optionStyle =
  TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.grey,fontFamily: 'Default',);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 12,),
              IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon: const Icon(Icons.arrow_back_ios,color: defaultColor,)),
              const Spacer(),
              Container(
                width: 250,
                height: 150,
                decoration: const BoxDecoration(
                  color: defaultColor,
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(500) ,bottomRight: Radius.circular(400)),
                ),
               child: Image.asset('assets/images/profile.png'),
              ),
            ],
          ),
          const SizedBox(height: 30,),
          const Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/Unknown_person.jpg'),
            ),
          ),
          const SizedBox(height: 35,),
          const Row(
            children: [
              SizedBox(width: 12,),
              Icon(Icons.person,color: Colors.grey,size: 30,),
              SizedBox(width: 12,),
              Text('Mohamed Ali',
                style: optionStyle,
              ),
            ],
          ),
          const SizedBox(height: 8,),
          const Divider(indent: 14,endIndent: 14 ,),
          const SizedBox(height: 25,),
          const Row(
            children: [
              SizedBox(width: 12,),
              Icon(Icons.email,color: Colors.grey,size: 30,),
              SizedBox(width: 12,),
              Text('MohamedAli12@gmail.com',
                style: optionStyle,
              ),
            ],
          ),
          const SizedBox(height: 8,),
          const Divider(indent: 14,endIndent: 14 ,),
          const SizedBox(height: 25,),
          const Row(
            children: [
              SizedBox(width: 12,),
              Icon(Icons.phone_android,color: Colors.grey,size: 30,),
              SizedBox(width: 12,),
              Text('01225644901',
                style: optionStyle,
              ),
            ],
          ),
          const SizedBox(height: 8,),
          const Divider(indent: 14,endIndent: 14 ,),
          const SizedBox(height: 25,),
          const Row(
            children: [
              SizedBox(width: 12,),
              Icon(Icons.lock,color: Colors.grey,size: 30,),
              SizedBox(width: 12,),
              Text('mohamed123',
                style: optionStyle,
              ),
            ],
          ),
          const SizedBox(height: 8,),
          const Divider(indent: 14,endIndent: 14 ,),
          const SizedBox(height: 25,),
          const Row(
            children: [
              SizedBox(width: 12,),
              Icon(FontAwesomeIcons.birthdayCake,color: Colors.grey,size: 30,),
              SizedBox(width: 12,),
              Text('20-6-1997',
                style: optionStyle,
              ),
            ],
          ),
          const SizedBox(height: 8,),
          const Divider(indent: 14,endIndent: 14 ,),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                width: 300,
                height: 43,
                decoration:  BoxDecoration(
                  color: defaultColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MaterialButton(
                  onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UpdatePhoto()));
                  },
                  child: const Text(
                    'Edit Profile',
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
          ),
        ],
      ),
    );
  }
}

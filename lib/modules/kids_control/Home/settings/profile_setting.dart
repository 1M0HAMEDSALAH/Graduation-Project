import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kidscontrol/modules/kids_control/Home/settings/update_profile.dart';
import 'package:kidscontrol/shared/styles/colors.dart';
import 'package:widget_loading/widget_loading.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  List<Map<String, dynamic>> profileData = [];
  bool _IsNull = true ;

  readData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Parents')
        .where('Uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    profileData = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    _IsNull = false ;
    setState(() {});
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  static const TextStyle optionStyle =
  TextStyle(fontSize: 17, fontWeight: FontWeight.w400,color: Colors.grey,fontFamily: 'Default',);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _IsNull ? Center(
          child: WiperLoading(
            child: LinearProgressIndicator(),
              ),
          )
     : Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 12,),
              IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon: const Icon(
                Icons.arrow_back_ios,
                color: defaultColor,
              ),),
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
           Center(
            child: profileData.isNotEmpty ? CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(profileData[0]['image']),
            ) : CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/Unknown_person.jpg'),
            )
          ),
          const SizedBox(height: 35,),
          Row(
            children: [
              const SizedBox(width: 12,),
              const Icon(Icons.person,color: Colors.grey,size: 30,),
              const SizedBox(width: 12,),
              Text(profileData.isNotEmpty ? profileData[0]['Name'] : 'Not Set',
                style: optionStyle,
              ),
            ],
          ),
          const SizedBox(height: 8,),
          const Divider(indent: 14,endIndent: 14 ,),
          const SizedBox(height: 25,),
          Row(
            children: [
              const SizedBox(width: 12,),
              const Icon(Icons.email,color: Colors.grey,size: 30,),
              const SizedBox(width: 12,),
              Text(profileData.isNotEmpty ? profileData[0]['Email'] : 'Not Set',
                style: optionStyle,
              ),
            ],
          ),
          const SizedBox(height: 8,),
          const Divider(indent: 14,endIndent: 14 ,),
          const SizedBox(height: 25,),
          Row(
            children: [
              const SizedBox(width: 12,),
              const Icon(Icons.phone_android,color: Colors.grey,size: 30,),
              const SizedBox(width: 12,),
              Text(profileData.isNotEmpty ? profileData[0]['Phone'] : 'Not Set',
                style: optionStyle,
              ),
            ],
          ),
          const SizedBox(height: 8,),
          const Divider(indent: 14,endIndent: 14 ,),
          const SizedBox(height: 25,),
          Row(
            children: [
              const SizedBox(width: 12,),
              const Icon(Icons.lock,color: Colors.grey,size: 30,),
              const SizedBox(width: 12,),
              Text(profileData.isNotEmpty ? profileData[0]['Password'] : 'Not Set',
                style: optionStyle,
              ),
            ],
          ),
          const SizedBox(height: 8,),
          const Divider(indent: 14,endIndent: 14 ,),
          const SizedBox(height: 25,),
          Row(
            children: [
              const SizedBox(width: 12,),
              const Icon(FontAwesomeIcons.birthdayCake,color: Colors.grey,size: 30,),
              const SizedBox(width: 12,),
              Text(profileData[0]['BD'] ?? 'Not Set',
                style: optionStyle,
              ),
            ],
          ),
          const Divider(indent: 14,endIndent: 14 ,),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              width: 300,
              height: 43,
              decoration:  BoxDecoration(
                color: defaultColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: MaterialButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdatePhoto(
                    oldname: profileData[0]['Name'],
                    oldPhone: profileData[0]['Phone'],
                    oldBd: profileData[0]['BD'],
                  )));
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
        ],
      ),
    );
  }
}
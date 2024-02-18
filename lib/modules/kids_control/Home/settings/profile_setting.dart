import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kidscontrol/modules/kids_control/Home/settings/Edit_profile_setting.dart';
import 'package:kidscontrol/shared/styles/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  static const TextStyle optionStyle =
  TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.grey,fontFamily: 'Default',);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('Profile',
          style: TextStyle(
            color: defaultColor,
          fontSize: 25.0,
          fontWeight: FontWeight.w700
      ),
      ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Center(
              child: CircleAvatar(
                radius: 60,
                child: Image.network('https://s3-alpha-sig.figma.com/img/f635/d305/9d9c329de8d912507f7cb09ec4f5efa0?Expires=1708905600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=EsTpr8i9wbK87z6U7llCa3U~H5nJmiVqVElivxr3-DN9JmaPokJnmZQEP-U1ic99jsB5-rVEc9cg~qyUdQNejWHgdShhRbZ~o1TFF-JCQn4LvOzJ4d-qI2wVB3CpylgUTdbDDznZqYKhh9gpm-iKnPnA3LhR1P-wt~PxlX0hogllgXU14bzFE6kJWscVEcYU6~35z6yGrUfZM3ERwILoLHIq67DKltoz~RQckM4PSVUgfYsdO8jvbTs-mMx0r3LfwvpdhONb8m7kIz-s6T~~6UZulVGdk6BXmSGOeWFDURMEtH~mqVbtLf5dOz19PO4pa4N-vLuww0xNq5aOG24jJw__'),
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditProfile()));
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
      ),
    );
  }
}

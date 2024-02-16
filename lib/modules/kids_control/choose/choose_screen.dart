import 'package:flutter/material.dart';
import 'package:kidscontrol/modules/kids_control/child_side/childside_screen.dart';
import 'package:kidscontrol/modules/kids_control/login/login_screen.dart';
import 'package:kidscontrol/shared/componants/componants.dart';
import 'package:kidscontrol/shared/styles/colors.dart';


class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
             const SizedBox(
                height: 30,
              ),
              const Center(
                child: Column(
                  children: [
                    Text(
                      "Choose your agent",
                      style: TextStyle(
                        color: defaultColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Default',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: (){
                  navigateTo(context, LoginScreen(),);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: defaultColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 350,
                  height: 250,
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          "parent phone",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Default',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        width: 275,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/choose1.jpg",),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: (){
                  navigateTo(context, const ChildSideScreen(),);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: defaultColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 350,
                  height: 250,
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          "Kid phone",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'Default',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        width: 275,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image:const DecorationImage(
                            image: AssetImage("assets/images/choose2.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

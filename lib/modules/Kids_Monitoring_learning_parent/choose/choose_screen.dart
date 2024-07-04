import 'package:flutter/material.dart';
import 'package:KidsMonitorAndLearning/modules/Kids_Monitoring_learning_Kid/KidSignIn/childside_screen.dart';
import 'package:KidsMonitorAndLearning/modules/Kids_Monitoring_learning_parent/login/login_screen.dart';
import 'package:KidsMonitorAndLearning/shared/componants/componants.dart';
import 'package:KidsMonitorAndLearning/shared/styles/colors.dart';


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
                height: 25,
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
                height: 55,
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
                  width: 260,
                  height: 250,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,

                      ),
                      const Center(
                        child: Text(
                          "parent phone",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Default',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 230,
                        height: 176,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/african family-amico.png",),
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
                  width: 260,
                  height: 250,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,

                      ),
                      const Center(
                        child: Text(
                          "Kid phone",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Default',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 230,
                        height: 176,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image:const DecorationImage(
                            image: AssetImage("assets/images/Kids playing with dolls-amico.png",
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

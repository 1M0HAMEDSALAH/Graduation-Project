import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:KidsMonitorAndLearning/shared/styles/colors.dart';

class Privacy extends StatefulWidget {
  const Privacy({super.key});

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Privacy',
          style: TextStyle(
            fontSize: 25,
            color: defaultColor,
            fontWeight: FontWeight.w700,
            fontFamily: 'Default',
          ),
        ),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Kids Control Application only access to the :',
                    style: TextStyle(
                      fontSize: 20,
                      color: defaultColor,
                      fontFamily: 'Default',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Row(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: Icon(Icons.circle_rounded,
                                size: 7,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(width:double.infinity ,
                                child: const Text('Location of your kids to let you know where are your kids .',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Default',
                                  ),),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Row(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: Icon(Icons.circle_rounded,
                                size: 7,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(width:double.infinity ,
                                child: const Text('All install apps to know what the apps your kids use .',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Default',
                                  ),),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Row(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: Icon(Icons.circle_rounded,
                                size: 7,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(width:double.infinity ,
                                child: const Text('Usaged For application to learn you how many times your kids access the apps .',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Default',
                                  ),),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Important guidelines :',
                    style: TextStyle(
                      fontSize: 20,
                      color: defaultColor,
                      fontFamily: 'Default',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Row(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: Icon(Icons.circle_rounded,
                                size: 7,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(width:double.infinity ,
                                child: const Text('To use our application you must signup with real account and verify it with the email link .',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Default',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Row(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: Icon(Icons.circle_rounded,
                                size: 7,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(width:double.infinity ,
                                child: const Text('To adding your kids :\nsignin and go to the dashboard and tap on the floating button then fill the fields we need and submit the go to dashboard and you will see the kid added you can remove the kid or edit the data of your kid , you also can chat with your kids and see where are your kids stay .',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Default',
                                  ),
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
        ),
      ),
    );
  }
}
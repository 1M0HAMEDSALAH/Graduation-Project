import 'package:flutter/material.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_Kid/laerning_side/pages/animals.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_Kid/laerning_side/pages/atoz.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_Kid/laerning_side/pages/birds.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_Kid/laerning_side/pages/parts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isImageClicked1 = false;
  bool _isImageClicked2 = false;
  bool _isImageClicked3 = false;
  bool _isImageClicked4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Learning Space',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isImageClicked1 = !_isImageClicked1;
                  });
                  Future.delayed(const Duration(milliseconds: 300), () {
                    //Navigator.pushNamed(context, AllRoutes.atozRoute);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AtoZ()));
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: _isImageClicked1 ? 325 : 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/images/alphabets.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'ALPHABETS',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text("Learn A to Z with pronunciation and an example"),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isImageClicked2 = !_isImageClicked2;
                  });
                  Future.delayed(const Duration(milliseconds: 300), () {
                    //Navigator.pushNamed(context, AllRoutes.animalRoute);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimalsPage()));
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: _isImageClicked2 ? 325 : 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/images/animals.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'ANIMALS',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text("Learn about animals and their voices"),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isImageClicked3 = !_isImageClicked3;
                  });
                  Future.delayed(const Duration(milliseconds: 300), () {
                    //Navigator.pushNamed(context, AllRoutes.partsRoute);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PartsPage()));
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: _isImageClicked3 ? 325 : 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/body/body.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'BODY PARTS',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text("Know about body parts and their pronunciation."),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isImageClicked4 = !_isImageClicked4;
                  });
                  Future.delayed(const Duration(milliseconds: 300), () {
                    //Navigator.pushNamed(context, AllRoutes.birdsRoute);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BirdsPage()));
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: _isImageClicked4 ? 325 : 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/images/birds.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'BIRDS',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text("Look out for Birds with their sounds."),
            ],
          ),
        ),
      ),
    );
  }
}
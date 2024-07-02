import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidscontrol/modules/Kids_Monitoring_learning_parent/Home/homepage.dart';
import 'package:kidscontrol/shared/styles/colors.dart';
import 'package:path/path.dart';

class AddKid extends StatefulWidget {
  const AddKid({super.key});

  @override
  State<AddKid> createState() => _AddKidState();
}

class _AddKidState extends State<AddKid> {

  File ? file;
  String ? url;
  bool _IsImage = true;

  AddKidImage()async {
    final ImagePicker picker = ImagePicker();
    final XFile? ImageKid = await picker.pickImage(source: ImageSource.gallery);
    if(ImageKid != null){
      file =File(ImageKid.path);
      var Refstorage = FirebaseStorage.instance.ref(basename(ImageKid.path));
      await Refstorage.putFile(file!);
      url = await Refstorage.getDownloadURL();
      _IsImage = false;
    }
    setState(() {});
  }

  _Kidinfo()async{
    await FirebaseFirestore
        .instance
        .collection('KidsSide')
        .doc(idController.text)
        .set({
      'FirstName' : firstNameController.text,
      'LastName' : lastNameController.text,
      'Email' : emailController.text,
      'Age' : ageController.text,
      'Id' : idController.text,
      'Uid' : FirebaseAuth.instance.currentUser!.uid,
      'Image' : url,
    }).then((value) => print('Done Addkid info'))
        .catchError((e)=>print(e));
  }

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var ageController = TextEditingController();
  var idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add Kid',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            fontFamily: 'default',
            color: defaultColor,
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
               Center(
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                     _IsImage ? CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/Unknown_person.jpg'),
                    )
                         :CircleAvatar(
                       radius: 50,
                       backgroundImage: NetworkImage(url!),
                     ),
                    CircleAvatar(
                      radius: 19,
                      backgroundColor: defaultColor,
                      child: IconButton(
                        onPressed: ()async {
                          await AddKidImage();
                        },
                        icon: const Icon(Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(controller: firstNameController,
                  keyboardType: TextInputType.name,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'The First Name Must Not Be Empty' ;
                    }
                    return null;
                  },
                  onFieldSubmitted: ( String value){
                    print(value);
                  },
                  onChanged: ( String value){
                    print(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    hintText: ' First Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(controller: lastNameController,
                  keyboardType: TextInputType.name,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'The Last Name Must Not Be Empty' ;
                    }
                    return null;
                  },
                  onFieldSubmitted: ( String value){
                    print(value);
                  },
                  onChanged: ( String value){
                    print(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    hintText: ' Last Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'The EmailAddress Must Contain @' ;
                    }
                    return null;
                  },
                  onFieldSubmitted: ( String value){
                    print(value);
                  },
                  onChanged: ( String value){
                    print(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: ' Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(controller: ageController,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'The Age Must Not Be Empty' ;
                    }
                    return null;
                  },
                  onFieldSubmitted: ( String value){
                    print(value);
                  },
                  onChanged: ( String value){
                    print(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    hintText: ' Age',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(controller: idController,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'The ID Must Not Be Empty' ;
                    }
                    return null;
                  },
                  onFieldSubmitted: ( String value){
                    print(value);
                  },
                  onChanged: ( String value){
                    print(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'ID',
                    hintText: ' ID',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: 300,
                height: 50,
                decoration:  BoxDecoration(
                  color: defaultColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MaterialButton(
                  child: const Text(
                    'Add Kid',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                  onPressed: ()async {
                    await _Kidinfo();
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> HomePage() ), (route) => false);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}

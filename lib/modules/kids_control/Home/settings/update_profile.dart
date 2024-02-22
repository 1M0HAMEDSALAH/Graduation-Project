import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidscontrol/modules/kids_control/Home/settings/profile_setting.dart';
import 'package:kidscontrol/shared/styles/colors.dart';

class UpdatePhoto extends StatefulWidget {
  final String oldname ;
  final String oldPhone ;
  final String oldBd ;
  const UpdatePhoto({super.key, required this.oldname, required this.oldPhone, required this.oldBd});

  @override
  State<UpdatePhoto> createState() => _UpdatePhotoState();
}

class _UpdatePhotoState extends State<UpdatePhoto> {


  ParentImage()async {
    final ImagePicker picker = ImagePicker();
    final XFile? ImageKid = await picker.pickImage(source: ImageSource.gallery);
    // if(ImageKid != null){
    //   file =File(ImageKid!.path);
    //   var Refstorage = FirebaseStorage.instance.ref(basename(ImageKid!.path));
    //   await Refstorage.putFile(file!);
    //   url = await Refstorage.getDownloadURL();
    //   _IsImage = false;
    // }
    // setState(() {});
  }

  UpDateProfile()async {
    await FirebaseFirestore.instance
        .collection('Parents').doc()
        .update({
      'Name': nameController.text,
      'Phone': phoneController.text,
      'BD': birthdayController.text,
    });
  }
  @override
  void initState() {
    super.initState();
    nameController.text = widget.oldname;
    phoneController.text = widget.oldPhone;
    birthdayController.text = widget.oldBd;
  }

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var birthdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/images/Unknown_person.jpg'),),
                        CircleAvatar(
                          radius: 19,
                          backgroundColor: defaultColor,
                          child: IconButton(
                            onPressed: ()async {
                              await ParentImage();
                            },
                            icon: const Icon(Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SafeArea(
                child:Center(
                  child: Text(
                    "Update Photo",
                    style: TextStyle(
                      fontSize: 15,
                      color: defaultColor,
                      fontFamily: 'Default',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(controller: nameController,
                  keyboardType: TextInputType.name,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'The Name Must Not Be Empty' ;
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
                    labelText: 'Name',
                    hintText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(controller: phoneController,
                  keyboardType: TextInputType.phone,
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
                    labelText: 'Phone',
                    hintText: ' Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(controller: birthdayController,
                  keyboardType: TextInputType.datetime,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'The Birthday Must Not Be Empty' ;
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
                    labelText: 'Birthday',
                    hintText: ' Birthday',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: defaultColor,
                    borderRadius: BorderRadius.circular(10),),
                  child: MaterialButton(
                    onPressed: ()async {
                      await UpDateProfile();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Update',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),),),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidscontrol/modules/kids_control/Home/settings/settings_screen.dart';
import 'package:kidscontrol/shared/styles/colors.dart';

class UpdatePhoto extends StatefulWidget {
  const UpdatePhoto({super.key});

  @override
  State<UpdatePhoto> createState() => _UpdatePhotoState();
}

class _UpdatePhotoState extends State<UpdatePhoto> {


  ParentImage()async {
    final ImagePicker picker = ImagePicker();
    final XFile? ImageKid = await picker.pickImage(source: ImageSource.gallery);
    //final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    // if(ImageKid != null){
    //   file =File(ImageKid!.path);
    //   var Refstorage = FirebaseStorage.instance.ref(basename(ImageKid!.path));
    //   await Refstorage.putFile(file!);
    //   url = await Refstorage.getDownloadURL();
    //   _IsImage = false;
    // }
    // setState(() {});
  }


  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var birthdayController = TextEditingController();
  bool _IsShow =true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
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
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email',
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
                child: TextFormField(obscureText: _IsShow,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'The Password Must Not Be Empty' ;
                    }
                    return null;
                  },
                  onFieldSubmitted: ( String value){
                    print(value);
                  },
                  onChanged: ( String value){
                    print(value);
                  },
                  decoration: InputDecoration(
                    suffixIcon:IconButton(
                      onPressed: (){
                        setState(() {
                          _IsShow = !_IsShow;
                        });
                      },
                      icon: _IsShow ? const Icon(
                        Icons.visibility_off,
                      )
                          : Icon(Icons.visibility),
                    ),
                    labelText: 'Password',
                    hintText: ' Password',
                    border: const OutlineInputBorder(),
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
                    onPressed: () {},
                    child: const Text('Update',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),),),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}
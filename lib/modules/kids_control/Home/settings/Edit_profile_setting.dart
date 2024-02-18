import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidscontrol/shared/styles/colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  AddImage()async {
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
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text(' Edit Profile',
          style: TextStyle(
              color: defaultColor,
              fontSize: 25.0,
              fontWeight: FontWeight.w700
          ),
        ),
        centerTitle: true,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                      ),
                      width: 150,
                      height: 170,
                      child: Column(
                        children: [
                          Image.network('https://s3-alpha-sig.figma.com/img/f635/d305/9d9c329de8d912507f7cb09ec4f5efa0?Expires=1708905600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=EsTpr8i9wbK87z6U7llCa3U~H5nJmiVqVElivxr3-DN9JmaPokJnmZQEP-U1ic99jsB5-rVEc9cg~qyUdQNejWHgdShhRbZ~o1TFF-JCQn4LvOzJ4d-qI2wVB3CpylgUTdbDDznZqYKhh9gpm-iKnPnA3LhR1P-wt~PxlX0hogllgXU14bzFE6kJWscVEcYU6~35z6yGrUfZM3ERwILoLHIq67DKltoz~RQckM4PSVUgfYsdO8jvbTs-mMx0r3LfwvpdhONb8m7kIz-s6T~~6UZulVGdk6BXmSGOeWFDURMEtH~mqVbtLf5dOz19PO4pa4N-vLuww0xNq5aOG24jJw__',height:120,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                          IconButton(
                              onPressed: ()async {
                                await AddImage();
                              },
                              icon: const Icon(FontAwesomeIcons.camera,color: defaultColor,),
                          ),
                              ],
                      ),
                        ],
                    ),
                  ),
                    const Text(
                      'Update Image',
                      style: TextStyle(
                          color: defaultColor,
                          fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12,),
                  ],
                ),
              ),
              TextFormField(
                      //controller: passwordController,
                      keyboardType: TextInputType.name,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'The name Must Not Be Empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                            Icons.person
                        ),
                        labelText: 'Name',
                        hintText: 'name',
                        border: OutlineInputBorder(),
                      ),
                    ),
              const SizedBox(height: 8,),
              TextFormField(
                //controller: passwordController,
                keyboardType: TextInputType.name,
                validator: (value){
                  if(value!.isEmpty){
                    return 'The email Must Not Be Empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                      Icons.email,
                  ),
                  labelText: 'Email',
                  hintText: 'email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                //controller: passwordController,
                keyboardType: TextInputType.name,
                validator: (value){
                  if(value!.isEmpty){
                    return 'The phone Must Not Be Empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                      Icons.phone_android,
                  ),
                  labelText: 'Phone',
                  hintText: 'phone',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                //controller: passwordController,
                keyboardType: TextInputType.name,
                validator: (value){
                  if(value!.isEmpty){
                    return 'The name Must Not Be Empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                      FontAwesomeIcons.birthdayCake,
                  ),
                  labelText: 'BD',
                  hintText: 'Your BirthDay',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 100,),
              Container(
                width: 300,
                height: 43,
                decoration:  BoxDecoration(
                  color: defaultColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MaterialButton(
                  onPressed: (){},
                  child: const Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Default',
                    ),
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

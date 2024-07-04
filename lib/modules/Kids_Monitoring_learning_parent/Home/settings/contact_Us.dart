import 'package:flutter/material.dart';
import 'package:KidsMonitorAndLearning/shared/styles/colors.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  var nameController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Contact Us',
          style: TextStyle(
            fontSize: 25,
            color: defaultColor,
            fontWeight: FontWeight.w700,
            fontFamily: 'Default',

          ),
        ),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset('assets/images/contactus.png',
                width: 200,
                height: 200,
              ),
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
                  hintText: ' Enter Your Name',
                  border: OutlineInputBorder(),
                ),
              ),
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
                  hintText: ' Enter Your Valid Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                maxLines: 5,
                keyboardType: TextInputType.text,
                validator: (value){
                  if(value!.isEmpty){
                    return 'The Square Must  Not Be Empty' ;
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
                  labelText: 'Your Opinion',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: double.infinity,
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                padding: const EdgeInsets.only(left: 15,top: 10),
                child: Row(
                  children: [
                    Icon(Icons.call,
                        color: defaultColor,
                        size: 30),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text('Call Us :',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
                const SizedBox(
                  width: 12,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Text('+20 1234567890',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Text('KidsMonitorAndLearning2024@gmail.com',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  width: 300,
                  decoration:  BoxDecoration(
                    color: defaultColor,
                    borderRadius: BorderRadius.circular(10),),
                  child: MaterialButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Kids Control Team'),
                            content: Text('Your Problem is Send Successfully \nThank you 💖.',style: TextStyle(color: defaultColor,fontSize: 20),),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



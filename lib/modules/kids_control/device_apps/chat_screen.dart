import 'package:flutter/material.dart';
import 'package:kidscontrol/shared/styles/colors.dart';
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {
  @override
  TextEditingController textController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/img.png'),
              ),
            ),
            SizedBox(
              width: 10,
            ),

            Text('Owais Mohamed',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),
            ),


          ],
        ),

      ),
      body: Column(
        children: [
         const  Spacer(),
          Row(
            children: [
              Container(
                width: 330,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller:textController,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration:const  InputDecoration(
                      hintText: 'message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              FloatingActionButton(
                backgroundColor:Colors.white,
                onPressed: (){
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: defaultColor,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

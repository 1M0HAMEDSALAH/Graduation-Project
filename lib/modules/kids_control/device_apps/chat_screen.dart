import 'package:flutter/material.dart';
import 'package:kidscontrol/shared/core/widgets/textformfield.dart';
import 'package:kidscontrol/shared/styles/colors.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        appBar: AppBar(
          title:const  Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Unknown_person.jpg'),
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Column(
            children: [
             Spacer(),
              SendMessage(),
            ],
          ),
        ),
      ),
    );
  }
}
  class SendMessage extends StatelessWidget {
  const SendMessage({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
  var size = MediaQuery.of(context).size;
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
        children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color:defaultColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: size.width / 1.3,
                child: TextFormFiled(
                  hint: 'Message',
                ),
               ),
              SizedBox(
                  width: 10
              ),
              const Icon(
                  Icons.send,
                  color: Colors.blue,
              ),
          ],
        ),
      );
  }
}

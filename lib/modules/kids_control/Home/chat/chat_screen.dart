import 'package:flutter/material.dart';
import 'package:kidscontrol/modules/kids_control/Home/chat/chat.dart';
import 'package:kidscontrol/shared/styles/colors.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Chats",
          style: TextStyle(
              color: defaultColor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: const Column(
          children: [
            ChatItems(),
            SizedBox(
              height: 20,
            ),
            ChatItems(),
          ],
        ),
      ),
    );
  }
}

class ChatItems extends StatelessWidget {
  const ChatItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ChatWidget()));
      },
      child: const Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/Unknown_person.jpg'),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Laila Mohammed",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "go to bed",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 120),
                  Text(
                    "10:30 PM",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

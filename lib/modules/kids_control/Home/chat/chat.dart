import 'package:flutter/material.dart';
import 'package:kidscontrol/shared/core/widgets/chat_colu.dart';
import 'package:kidscontrol/shared/core/widgets/textformfield.dart';
import 'package:kidscontrol/shared/model/chat_model.dart';


// ignore: use_key_in_widget_constructors
class ChatWidget extends StatelessWidget {
  final List<Message> messages = [
    Message(sender: 'Me', text: 'Hello!'),
    Message(sender: 'Friend', text: 'Hi there!'),
    Message(sender: 'Me', text: 'How are you?'),
    Message(sender: 'Friend', text: 'I am good, thanks!'),
    Message(sender: 'Friend', text: 'And you?'),
    Message(sender: 'Me', text: 'I am doing well too.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 10),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 5),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/Unknown_person.jpg'),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Laila Mohammeed',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 40),

          ],
        ),
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final message = messages[index];
                  return MessageBubble(
                    sender: message.sender,
                    text: message.text,
                    isMe: message.sender == 'Me',
                  );
                },
              ),
            ),
            const SendMessage(),
            const SizedBox(height: 20)
  ]),
    )
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
    return Row(
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
          width: size.width / 1.3,
          child: TextFormFiled(
            hint: 'Message',
          ),
        ),
        SizedBox(width: 20),
        const Icon(
          Icons.send,
          color: Colors.blue,
        ),
      ],
    );
  }
}

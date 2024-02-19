
import 'package:flutter/material.dart';
import 'package:kidscontrol/shared/core/widgets/circle.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;

  // ignore: use_key_in_widget_constructors
  const MessageBubble({required this.sender, required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          isMe
              ? const SizedBox()
              : const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/Unknown_person.jpg'),
          ),
          const SizedBox(width: 8),
          Material(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(30),
              topRight: const Radius.circular(30),
              bottomLeft: isMe ? const Radius.circular(30) : Radius.zero,
              bottomRight: isMe ? Radius.zero : const Radius.circular(30),
            ),
            color: isMe ? Colors.blue[700] : Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                    color: isMe ? Colors.white : Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

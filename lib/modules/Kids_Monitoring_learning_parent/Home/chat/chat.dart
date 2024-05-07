import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

late User signedInUser;

class ChatScreen extends StatefulWidget {
  static const String screenRoute = 'chat_screen';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ImagePicker _imagePicker = ImagePicker();

  String? messageText;
  File? imageFile;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Chat",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('Parents')
                    .doc(_auth.currentUser!.uid)
                    .collection('Messages')
                    .orderBy('time')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blue,
                      ),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text("No messages yet!"),
                    );
                  }
                  return buildMessagesList(snapshot.data!.docs.toList().reversed.toList());
                },
              ),
            ),
            buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget buildMessagesList(List<QueryDocumentSnapshot> messages) {
    return ListView.builder(
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        final messegeText = message['text'];
        final messegesender = message['sender'];
        final currentUser = signedInUser.email;

        return MessageLine(
          sender: messegesender,
          text: messegeText,
          isMe: currentUser == messegesender,
        );
      },
    );
  }

  Widget buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () async {
              final pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
              if (pickedImage != null) {
                setState(() {
                  imageFile = File(pickedImage.path);
                });
              }
            },
            icon: const Icon(
              Icons.image,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                controller: messageTextController,
                onChanged: (value) {
                  messageText = value;
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  hintText: 'Write your message here...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              sendMessage();
            },
            icon: const Icon(
              Icons.send,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage() {
    if (messageText != null || imageFile != null) {
      _firestore.collection('Parents')
          .doc(_auth.currentUser!.uid)
          .collection('Messages')
          .add({
        'text': messageText,
        'sender': signedInUser.email,
        'time': FieldValue.serverTimestamp(),
      });

      if (imageFile != null) {
        uploadImage(imageFile!);
      }

      messageTextController.clear();
      setState(() {
        imageFile = null;
      });
    }
  }

  void uploadImage(File imageFile) async {
    try {
      final Reference refStorage = FirebaseStorage.instance.ref().child(
          basename(imageFile.path));
      await refStorage.putFile(imageFile);
      final imageUrl = await refStorage.getDownloadURL();

      _firestore.collection('Parents')
          .doc(_auth.currentUser!.uid)
          .collection('Messages')
          .add({
        'image_url': imageUrl,
        'sender': signedInUser.email,
        'time': FieldValue.serverTimestamp(),
      });
    } catch (error) {
      print(
          "Error uploading image: $error"); // استخدم print() لطباعة الاستثناءات
    }
  }
}

class MessageLine extends StatelessWidget {
  const MessageLine({this.text, this.sender, required this.isMe, Key? key}) :
        super(key: key);

  final String? sender;
  final String? text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            '$sender',
            style: TextStyle(fontSize: 12, color: Colors.black45),
          ),
          Material(
            elevation: 5,
            borderRadius: isMe ? BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )
                :BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),

            color: isMe ? Colors.blue[800] : Colors.white,


            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                '$text',
                style: TextStyle(
                    fontSize: 20,
                    color: isMe ? Colors.white : Colors.black  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
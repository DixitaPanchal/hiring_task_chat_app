import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:interview/components/chat_bubble.dart';
import 'package:interview/components/mytextfield.dart';
import 'package:interview/services/chat/chat_service.dart';

class ChatPage extends StatefulWidget {
  final String receiveruserEmail;
  final String receiverUserId;

  const ChatPage(
      {super.key,
      required this.receiveruserEmail,
      required this.receiverUserId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService chatService = ChatService();
  final ScrollController scrollController = ScrollController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {

    if (_messageController.text.isNotEmpty) {
      await chatService.sendMessage(
          widget.receiverUserId, _messageController.text);

      _messageController.clear();


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiveruserEmail),
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildMessageInput(),
          SizedBox(height: 25,),

          ],
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(

        stream: chatService.getMessage(
            widget.receiverUserId, _firebaseAuth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error${snapshot.error}");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
              children: snapshot.data!.docs
                  .map((document) => _buildMessageItem(document))
                  .toList());
        });
  }

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;



    return Container(
        alignment: alignment,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: (data['sendeId']  == _firebaseAuth.currentUser!.uid) ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisAlignment: (data['senderId']   == _firebaseAuth.currentUser!.uid) ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Text(data['senderEmail']),
              SizedBox(height: 5,),
              ChatBubble(message: data['message'], timestamp: '${(data['timestamp'] as Timestamp).toDate()}' ),


            ],
          ),
        ));
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Expanded(
              child: MyTextField(
            controller: _messageController,
            hintText: 'Enter message',
            obscuretxt: false,
          )),
          IconButton(
              onPressed: () {
                sendMessage();
              },
              icon: Icon(
                Icons.send,
                size: 40,
              ))
        ],
      ),
    );
  }
}

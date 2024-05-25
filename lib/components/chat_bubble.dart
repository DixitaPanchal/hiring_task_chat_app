import 'package:flutter/material.dart';


class ChatBubble extends StatelessWidget {

  final String message;
  final String timestamp;
  const ChatBubble({super.key, required this.message, required this.timestamp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue
      ),
      child: Column(
        children: [
          Text(
            message,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Text( timestamp,
            style: TextStyle(fontSize: 15, color: Colors.black),
          )
        ],
      ),
    );
  }
}

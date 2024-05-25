import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:interview/model/message.dart';

class ChatService extends ChangeNotifier{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void> sendMessage(String receiveId, String message) async {

    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    Message newMessgae = Message(currentUserId, currentUserEmail, receiveId, message, timestamp);


    List<String> ids = [currentUserId, receiveId];
    ids.sort();
    String chatRoomId = ids.join("_");
    
    await _firestore.collection("chat_rooms").doc(chatRoomId).collection("messages").add(newMessgae.toMap());

  }


  Stream<QuerySnapshot> getMessage(String userId, String otherUserId){

    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");


    return _firestore.collection('chat_rooms').doc(chatRoomId).collection('messages').orderBy('timestamp' , descending: false).snapshots();

  }



}
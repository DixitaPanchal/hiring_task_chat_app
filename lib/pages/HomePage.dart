
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interview/pages/ChatPage.dart';
import 'package:interview/screens/CardForm.dart';
import 'package:interview/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class HomePgae extends StatefulWidget {
  const HomePgae({super.key});

  @override
  State<HomePgae> createState() => _HomePgaeState();
}


class _HomePgaeState extends State<HomePgae> {


  final FirebaseAuth _auth = FirebaseAuth.instance;


  void signOut(){

    final authService= Provider.of<AuthService>(context, listen: false);

    authService.signout();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CardFormScreen(),));

          }, icon: Icon(Icons.payment)),

          IconButton(onPressed: (){
            signOut();
          }, icon: Icon(Icons.logout))

        ],
      ),

      body: _buildUserList()
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('users').snapshots(), builder: (context, snapshot) {
      if(snapshot.hasError){
        Text("Error");

      }

      if(snapshot.connectionState == ConnectionState.waiting){
        return Text("Loading...");
      }

      return ListView(
        children:
          snapshot.data!.docs.map<Widget>((doc) => _buildUserListItem(doc)).toList()
        ,);
    },);
  }

  Widget _buildUserListItem(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;

    if(_auth.currentUser!.email != data['email']! ){
      return ListTile(
        title: Text(data['email']),
        onTap: (){

          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(receiveruserEmail: data['email'], receiverUserId: data['uid'],

          )));

        },


      );
    }
    else{
      return Container();

    }

  }
}

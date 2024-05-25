import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<UserCredential> signInWithEmailPassword(String email, String password) async {
    try{
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      _firestore.collection("users").doc(userCredential.user!.uid).set({
        'uid' : userCredential.user!.uid,
        'email' : userCredential.user!.email,


      });



      return userCredential;
    } on FirebaseAuthException catch(E){
      throw Exception(E.code);

    }

  }

  Future<UserCredential> signUpWithEmailAndPassword(String email, String username, String password) async{
    try{

      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password );

      _firestore.collection("users").doc(userCredential.user!.uid).set({
        'uid' : userCredential.user!.uid,
        'email' : userCredential.user!.email,


      }, SetOptions(merge: true));


      return userCredential;
      
    }

    on FirebaseException catch(E) {
      throw Exception(E.code);
      
    }
  }




  Future<void> signout() async {
    return await FirebaseAuth.instance.signOut();

}
}
import 'package:flutter/material.dart';
import 'package:interview/pages/login.dart';
import 'package:interview/pages/signinpage.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  bool showLoginPage = true;


  void togglePage(){
    setState(() {
      showLoginPage = !showLoginPage;

    });

  }


  @override
  Widget build(BuildContext context) {
    if(showLoginPage) {
      return LoginPage(onTap: togglePage);
    }
    else{
      return SignInPage(onTap: togglePage);
    }
  }
}

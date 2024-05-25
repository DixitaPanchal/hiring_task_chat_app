import 'package:flutter/material.dart';
import 'package:interview/components/mytextfield.dart';
import 'package:interview/pages/signinpage.dart';
import 'package:interview/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passctr = TextEditingController();


  void signIn() async{
    final authService = Provider.of<AuthService>(context, listen: false);

    try{
      await authService.signInWithEmailPassword(emailCtr.text, passctr.text);
    }
    catch(E){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(E.toString())));

    }
  }


  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }


  Widget _buildBody(){
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.chat, size: 80, color: Colors.blueAccent,),
              Text("Welcome back, you have been missed!", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.blueAccent), ),
          
             MyTextField(controller: emailCtr, hintText: "Email", obscuretxt: false),
          
              MyTextField(controller: passctr, hintText: "Password", obscuretxt: true),
          
              GestureDetector(
                onTap: (){
                  signIn();
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(child: Text("Login" ,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                  ),
                ),
              ),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: TextStyle(fontSize: 15, color: Colors.grey.shade600),),
                  GestureDetector(
                    onTap: widget.onTap,
                      child: Text("Sign Up", style: TextStyle(fontSize: 17, color: Colors.blueAccent, fontWeight: FontWeight.bold),)),
                ],
              ),
          
          
          
            ],
          
          
          ),
        ),
      ),

    );
  }


}

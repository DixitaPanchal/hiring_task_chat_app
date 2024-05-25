import 'package:flutter/material.dart';
import 'package:interview/components/mytextfield.dart';
import 'package:interview/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  final void Function()? onTap;

  const SignInPage({super.key, this.onTap});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController emailCtr = TextEditingController();
  TextEditingController passctr = TextEditingController();

  TextEditingController usernamectr = TextEditingController();



  void singUp() async{

    final authService = Provider.of<AuthService>(context, listen: false);

    try{
      await authService.signUpWithEmailAndPassword(emailCtr.text, usernamectr.text, passctr.text);

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
              Text("Register now!", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.blueAccent), ),
          
              MyTextField(controller: emailCtr, hintText: "Email", obscuretxt: false),
              MyTextField(controller: usernamectr, hintText: "Username", obscuretxt: false),
          
          
              MyTextField(controller: passctr, hintText: "Password", obscuretxt: true),
          
          
              GestureDetector(
                onTap: (){
                  singUp();

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
                    child: Center(child: Text("Sign Up" ,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                  ),
                ),
              ),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already a member? ", style: TextStyle(fontSize: 15, color: Colors.grey.shade600),),
                  GestureDetector(
                    onTap: widget.onTap,
                      child: Text("Login", style: TextStyle(fontSize: 17, color: Colors.blueAccent, fontWeight: FontWeight.bold),)),
                ],
              ),
          
          
          
            ],
          
          
          ),
        ),
      ),

    );
  }


}

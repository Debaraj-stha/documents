import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  @override
  String email = "xyz@gmail.com";
  FirebaseAuth auth=FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      auth.sendPasswordResetEmail(email: email).then((val)=>{

      });
    }, child: Text("Forgot"));
  }
}
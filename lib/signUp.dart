import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "dstha221@gmail.com";
  String password = "abcd11234";
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async{
          setState(() {
              isLoading=true;
            });
       await   auth.createUserWithEmailAndPassword(email: email, password: password).then((value)=>{
            // print(value),
            setState(() {
              isLoading=false;
            })
          }).onError((error, stackTrace) => {
            // print(error)
            }
            );
             setState(() {
              isLoading=false;
            });
              // .signUpWithEmailAndPassword(email: email, password: password)
              // .then((value) => print(value))
              // .onError((error, stackTrace) => print(error));
        },
        child:isLoading?CircularProgressIndicator(): Text("sign Up"));
  }
}

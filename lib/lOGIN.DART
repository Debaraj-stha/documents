import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all/homepage.dart';

import 'forgotPassword.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "xyz@gmail.com";
  String password = "abcd11234";
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () async{
              setState(() {
                  isLoading=true;
                });
                // print(email+password);
                await  auth.signInWithEmailAndPassword(email: email, password: password)
                  .then((value) =>{
                    // print(value.user!.email),
                    setState(() {
                  isLoading=false;
                }),
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const homepage()))
                  }).onError((error, stackTrace) => {
                setState(() {
                  isLoading=false;
                })
                  });
            },
            child:isLoading?CircularProgressIndicator(): Text("Login")),
            TextButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>const forgotPassword()));
            }, child: Text("Forgt password"))
      ],
    );
  }
}

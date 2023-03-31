import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all/varificationPage.dart';
class loginWithPhone extends StatefulWidget {
  const loginWithPhone({super.key});

  @override
  State<loginWithPhone> createState() => _loginWithPhoneState();
}

class _loginWithPhoneState extends State<loginWithPhone> {
   String phone="+977 9819 336 010";
  FirebaseAuth auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: ()async{
      // print(phone);
    await  auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (_) async{

      }, verificationFailed: (e)async{
        // print(e);
      },
       codeSent:(String vari,int?token)async{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>varificationPage(id:vari)));
      },
       codeAutoRetrievalTimeout:(e)async{
        // print(e);
      });
    }, child: Text("login with phone"));
  }
}
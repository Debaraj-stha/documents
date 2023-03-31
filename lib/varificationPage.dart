import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all/homepage.dart';
class varificationPage extends StatefulWidget {
  const varificationPage({super.key,required this.id});
final String id;
  @override
  State<varificationPage> createState() => _varificationPageState();
}

class _varificationPageState extends State<varificationPage> {
  TextEditingController controller=TextEditingController();
  FirebaseAuth auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
        ),
        TextButton(onPressed: ()async{
          final credential=PhoneAuthProvider.credential(verificationId: widget.id, smsCode: controller.text.toString());
          try{
            await auth.signInWithCredential(credential);
            Navigator.push(context,MaterialPageRoute(builder: (context)=>homepage()));
          }catch(e){
            // print(e);
          }
        }, child: Text("Verify"))
      ],
    );
  }
}
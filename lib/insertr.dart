import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_all/controller/dbcontroller.dart';
import 'package:flutter_all/model/a.dart';
import 'package:flutter_all/utils/message.dart';

class insert extends StatefulWidget {
  const insert({super.key});

  @override
  State<insert> createState() => _insertState();
}

class _insertState extends State<insert> {
  dbController? controller;
  messageController? message;
  @override
  void initState() {
    // TODO: implement initState
    message=messageController();
    controller = dbController();
  }
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
controller?.insert(a(name: "hari", address: "madesh",)).then((value){
  message?.showmessage(value.name + value.address + value.id.toString());
}).onError((error, stackTrace){
  message?.showmessage(error.toString(),);
});
    }, child: Text("Insert"));
  }

}
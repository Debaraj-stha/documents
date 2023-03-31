import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class messageController {
  void showmessage(String message, ) {
    Fluttertoast.showToast(
        msg: message,
        fontSize: 16,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        // textColor: textcolor,
        // webBgColor: backgroundColor,
        
        webShowClose: true,
       );
  }
}

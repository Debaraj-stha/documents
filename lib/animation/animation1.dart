import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
class animation1 extends StatefulWidget {
  const animation1({super.key});

  @override
  State<animation1> createState() => _animation1State();
}

class _animation1State extends State<animation1>
    with SingleTickerProviderStateMixin {
  @override
  bool isSeelecyted=false;
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder(tween: Tween<double>(begin: 20,end: 100), duration:Duration(seconds: 1),builder: (context, value, child) {
        return Icon(Icons.person,size: value,);
        }),
        GestureDetector(
          onTap: () => setState(() {
            isSeelecyted=!isSeelecyted;
          }),
          child: Container(
            padding: EdgeInsets.all(16),
            child: AnimatedDefaultTextStyle(child: Text("TEXT"), style: isSeelecyted?TextStyle(color: Colors.red):TextStyle(color: Colors.blue), duration: Duration(seconds: 2)))),
      ],
    );
  }
}

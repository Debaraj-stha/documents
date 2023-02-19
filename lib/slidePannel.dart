import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
class slidePannel extends StatefulWidget {
  const slidePannel({super.key});

  @override
  State<slidePannel> createState() => _slidePannelState();
}

class _slidePannelState extends State<slidePannel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 200,
        maxHeight: 600,
        collapsed: Container(
          child: Center(child: Text("This method isn't recommended but can still be used. Only use this to avoid refactoring large chunks of code or to implement custom scrolling behavior. For example, the SlidingUpPanel can be nested inside of a Stack (note that there are many other possible implementations that vary on a case-by-case basis).")),
        ),
        body: Container(
          child: Column(
            children: [
                Text("This method isn't recommended but can to an be nested inside of a Stack (no"),
                Text("This method isn't recommended but can to an be nested inside of a Stack (no"),
                Text("This method isn't recommended but can to an be nested inside of a Stack (no"),
                Text("This method isn't recommended but can to an be nested inside of a Stack (no"),
            ],
          ),
        ),
      ),
    );
  }
}
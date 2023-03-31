import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:page_transition/page_transition.dart';

class pageViewDemo extends StatefulWidget {
  const pageViewDemo({super.key});

  @override
  State<pageViewDemo> createState() => _pageViewDemoState();
}

class _pageViewDemoState extends State<pageViewDemo> {
  late final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: secondPage(),
                      type: PageTransitionType.leftToRight));
            },
            child: Text("Left To Right Transition Second Page")),
            TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                    alignment: Alignment.topLeft,
                      child: secondPage(),
                      type: PageTransitionType.size));
            },
            child: Text("Bottom To Top")),
            TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                    alignment: Alignment.center,
                      child: secondPage(),
                      type: PageTransitionType.scale
                      ));
            },
            child: Text("scale"))
      ],
    )
        // PageView.builder(
        //   controller: controller,
        //   itemCount: 10,
        //   itemBuilder: (context,i){
        //     return Container(
        //       height: MediaQuery.of(context).size.height,
        //       width: double.infinity,
        //       color: Colors.red,
        //       child: Center(
        //         child: Text("Page $i"),
        //       ),
        //     );
        // }),
        );
  }
}

class secondPage extends StatelessWidget {
  const secondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: TextButton(
        child: Text("Back"),
        onPressed: (){
        Navigator.pop(context);
      }),),
    );
  }
}

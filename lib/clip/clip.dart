import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:math' as math;

import '../userList.dart';

class clipper extends StatefulWidget {
  const clipper({super.key});

  @override
  State<clipper> createState() => _clipperState();
}

class _clipperState extends State<clipper> with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(vsync: this, duration: Duration(seconds: 10))
        ..repeat();
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 1));
  bool isSelected = false;
  void dispose() {
    controller.dispose();
  }

  List item = [];
  final key = GlobalKey<AnimatedListState>();
  void addItem() {
    print("dkdkkd");
    item.insert(0, "Items ${item.length + 1}");
    key.currentState?.insertItem(0, duration: Duration(seconds: 1));
  }

  void deleteItem(int index) {
    key.currentState?.removeItem(index, (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: Card(
          child: Text("deletd"),
        ),
      );
    }, duration: Duration(seconds: 1));
    item.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Expanded(
          //   child: AnimatedList(
          //       physics: NeverScrollableScrollPhysics(),
          //       initialItemCount: item.length,
          //       key: UniqueKey(),
          //       itemBuilder: (context, index, animation) {
          //         return SizeTransition(
          //           sizeFactor: animation,
          //           child: Card(
          //             child: ListTile(
          //               title: Text(item[index]),
          //             ),
          //           ),
          //         );
          //       }),
          // ),
          // Container(
          //   child: AnimatedBuilder(
          //     animation: controller,
          //     child: FlutterLogo(),
          //     builder: (context, child) {
          //       return Transform.rotate(
          //         angle: controller.value * math.pi * 2.0,
          //         child: child,
          //       );
          //     },
          //   ),
          // ),
          // /*
          // InkWell(
          //     onTap: () {
          //       if (isSelected == false) {
          //         controller.forward();
          //         setState(() {
          //           isSelected = true;
          //         });
          //       } else {
          //         controller.reverse();
          //         setState(() {
          //           isSelected = false;
          //         });
          //       }
          //     },
          //     child: AnimatedIcon(
          //       icon: AnimatedIcons.add_event,
          //       progress: controller,
          //       size: 30,
          //       color: Colors.blue,
          //     )),
          //     */

          // TweenAnimationBuilder(
          //   tween: Tween<double>(begin: 20, end: 60),
          //   duration: Duration(seconds: 1),
          //   builder: (context, value, child) {
          //     return Container(
          //       child: Text(
          //         "tween animation",
          //         style: TextStyle(color: Colors.white),
          //       ),
          //       height: value,
          //       width: value,
          //       color: Colors.red,
          //     );
          //   },
          // ),
          // TextButton(
          //   onPressed: () {
          //     addItem();
          //   },
          //   child: Text("Add"),
          // ),
          // ClipPath(
          //   clipper: BottomCurveClipper(),
          //   child: Container(
          //     height: 300,
          //     color: Colors.blue,
          //   ),
          // ),
          // Container(
          //   height: 200,
          //   child: ClipPath(
          //     clipper: CurlyCurveClipper(),
          //     child: Container(
          //       color: Colors.blue,
          //     ),
          //   ),
          // ),
          // Container(
          //   height: 200,
          //   child: ClipPath(
          //     clipper: BottomWaveClipper(),
          //     child: Container(
          //       color: Colors.red,
          //     ),
          //   ),
          // ),
          // Container(
          //   height: 200,
          //   child: ClipPath(
          //     clipper: WaveClipper(),
          //     child: Container(
          //       color: Colors.blue,
          //     ),
          //   ),
          // ),
          // ClipOval(
          //   clipper: CustomOvalClipper(),
          //   child: Container(
          //     color: Colors.blue,
          //     width: 200,
          //     height: 100,
          //   ),
          // ),
          // ClipOval(
          //   child: Container(
          //     height: 100,
          //     width: 150,
          //     color: Colors.red,
          //   ),
          // ),
          // ClipPath(
          //   clipper: Traigle(),
          //   child: Container(
          //     height: 200,
          //     width: 400,
          //     color: Colors.green,
          //   ),
          // ),
          // ClipPath(
          //   clipper: Curve(),
          //   child: Container(
          //     height: 200,
          //     width: 400,
          //     color: Colors.green,
          //   ),
          // ),
          ListView.builder(
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text("Item $index"),
              );
            }),
            itemCount: 10,
            physics: NeverScrollableScrollPhysics(),
          )
        ],
      ),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height + 50, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomOvalClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, size.height / 4, size.width, size.height / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}

class CurlyCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Move to the start of the curve
    path.moveTo(0, size.height / 2);

    // Draw a loop of the curve
    path.cubicTo(size.width / 3, size.height / 3, 2 * size.width / 3,
        2 * size.height / 3, size.width, size.height / 2);

    // Draw a straight line to the end of the curve
    path.lineTo(size.width, size.height);

    // Draw a straight line back to the start of the curve
    path.lineTo(0, size.height);

    // Close the path to create a closed shape
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class Traigle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class Curve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..quadraticBezierTo(0, size.height, 0, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Move to the start of the curve
    path.moveTo(0, size.height / 2);

    // Draw a cubic Bezier curve to create the wave shape
    path.cubicTo(size.width / 4, size.height / 4, 3 * size.width / 4,
        3 * size.height / 4, size.width, size.height / 2);

    // Draw a straight line to the end of the container
    path.lineTo(size.width, size.height);

    // Draw a straight line back to the start of the container
    path.lineTo(0, size.height);

    // Close the path to create a closed shape
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Move to the start of the curve
    path.moveTo(0, size.height);

    // Draw a cubic Bezier curve to create the wave shape
    path.cubicTo(
      size.width / 6,
      size.height * 0.9,
      size.width / 3,
      size.height * 0.8,
      size.width / 2,
      size.height * 0.9,
    );
    path.cubicTo(
      size.width * 2 / 3,
      size.height,
      size.width * 5 / 6,
      size.height * 0.8,
      size.width,
      size.height * 0.9,
    );

    // Draw a straight line to the end of the container
    path.lineTo(size.width, size.height);

    // Draw a straight line back to the start of the container
    path.lineTo(0, size.height);

    // Close the path to create a closed shape
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

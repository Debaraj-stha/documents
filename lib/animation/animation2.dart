import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class animation2 extends StatefulWidget {
  const animation2({super.key});

  @override
  State<animation2> createState() => _animation2State();
}

class _animation2State extends State<animation2> with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(vsync: this, duration: (Duration(seconds: 2)));
  void dispose() {
    controller.dispose();
  }

  List item = [];
  final key = GlobalKey<AnimatedListState>();
  void addItem() {
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
late final ScrollController scrollController=ScrollController();
double ofset=0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      setState(() {
        ofset=scrollController.offset;
      });
     });
  }
  void disposeState() {
    scrollController.dispose()
;
super.dispose() ;
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification) {
          setState(() {
            ofset = notification.metrics.pixels;
          });
          return true;
        },
        child: Transform.translate(
          offset: Offset(0, ofset),
          child: ListView.builder(
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text("Item $index"),
              );
            }),
            itemCount: 30,
            // shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
          ),
        ),
            // child: ListView(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
              
            //     children: [
            // Expanded(
            //   child: Container(
            //     height: 400,
            //     child: AnimatedList(
            //         physics: NeverScrollableScrollPhysics(),
            //         initialItemCount: 0,
            //         key: key,
            //         itemBuilder: (context, index, animation) {
            //           return SizeTransition(
            //             key: UniqueKey(),
            //             sizeFactor: animation,
            //             child: Card(
            //               child: ListTile(
            //                 title: Text(item[index]),
            //                 trailing: TextButton(
            //                     onPressed: () {
            //                       deleteItem(index);
            //                     },
            //                     child: Text("Delete")),
            //               ),
            //             ),
            //           );
            //         }),
            //   ),
            // ),
            // TextButton(
            //   onPressed: () {
            //     addItem();
            //   },
            //   child: Text("Add"),
            // ),
            // ClipPath(
            //   clipper: Traingle(),
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     color: Colors.red,
            //   ),
            // ),
            // Text("data"),
            // ClipPath(
            //   clipper: Curve(),
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     color: Colors.red,
            //   ),
            // ),
            // ClipPath(
            //   clipper: Curve1(),
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     color: Colors.red,
            //   ),
            // ),
            // Text("dat"),
            // ClipPath(
            //   clipper: Curve2(),
            //   child: Container(
            //     height: 200,
            //     width: double.infinity,
            //     color: Colors.red,
            //   ),
            // ),
            
              //   ],
              // ),
        )
    );
  }
}

// class Traingle extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     // TODO: implement getClip
//     return Path()
//       ..lineTo(0, size.height)
//       ..lineTo(size.width, size.height)
//       ..lineTo(size.width, 0);
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//    return false;
//   }
// }

// class Curve extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     // TODO: implement getClip
//     return Path()
//       ..lineTo(0, size.height)
//       ..lineTo(size.width, size.height)
//       ..quadraticBezierTo(size.width, 0, 0, 0);
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     return false;
//   }
// }

// class Curve1 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     // TODO: implement getClip
//     return Path()
//       ..lineTo(0, size.height)
//       ..lineTo(size.width, size.height)
//       ..quadraticBezierTo(0, size.height, 0, 0);
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     return false;
//   }
// }

// class Curve2 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     // TODO: implement getClip
//     return Path()
//       ..lineTo(0, size.height-50)
//       ..quadraticBezierTo(size.width/2, size.height+50, size.width,size.height-50)..lineTo(size.width, 0);
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//    return false;
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:math' as math;

import 'package:flutter_all/animation/animation1.dart';

class animate extends StatefulWidget {
  const animate({super.key});

  @override
  State<animate> createState() => _animateState();
}

class _animateState extends State<animate>
    with TickerProviderStateMixin<animate> {
  @override
  late final AnimationController controller =
      AnimationController(vsync: this, duration: Duration(seconds: 10))
        ..repeat();
  late AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 1));
  void dispose() {
    controller.dispose();
    _controller.dispose();
    super.dispose();
  }

  bool isSelected = false;
  bool isPlay = false;
  List item = [];
  int count = 0;
  final listKey = GlobalKey<AnimatedListState>();
  void addItem() {
    item.insert(0, "Items ${item.length + 1}");
    listKey.currentState?.insertItem(0, duration: Duration(seconds: 1));
  }
void addIte(){
  item.insert(0, "item ${item.length+1}");
  listKey.currentState?.insertItem(0,duration: Duration(seconds: 1));
}
void deleteItems(int index){
listKey.currentState?.removeItem(index, (context, animation){
return SizeTransition(sizeFactor:animation,child: const Card(
  child:Text("deleted") ,
),

);

},duration: Duration(seconds: 1)
);
item.removeAt(index);
}
  void deleteItem(int index) {
    listKey.currentState!.removeItem(index, (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: Card(
          color: Colors.red,
          child: ListTile(
            title: Text("deleted"),
          ),
        ),
      );
    }, duration: Duration(seconds: 300)
    );
    item.removeAt(index);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isSelected = !isSelected;
              });
            },
            child: Column(
              children: [
                animation1(),
                Container(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.red,
                    padding: EdgeInsets.all(13),
                    child: AnimatedAlign(
                        alignment: isSelected
                            ? Alignment.topRight
                            : Alignment.bottomLeft,
                        duration: Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn,
                        child: Text("animation")),
                  ),
                ),
                Container(
                  child: AnimatedBuilder(
                      animation: controller,
                      child: FlutterLogo(
                        size: 100,
                      ),
                      builder: (context, Widget? child) {
                        return Transform.rotate(
                          angle: controller.value * math.pi * 2.0,
                          child: child,
                        );
                      }),
                ),
                AnimatedContainer(
                  curve: Curves.fastOutSlowIn,
                  height: isSelected ? 300 : 200,
                  width: 150,
                  duration: Duration(seconds: 2),
                  alignment:
                      isSelected ? Alignment.center : Alignment.topCenter,
                  color: isSelected ? Colors.blue : Colors.blueAccent,
                  child: FlutterLogo(
                    size: 75,
                  ),
                ),
                AnimatedCrossFade(
                    firstChild: Text("First child"),
                    secondChild: Text("second child"),
                    crossFadeState: isSelected
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(seconds: 2)),
                InkWell(
                    onTap: () {
                      if (isPlay == false) {
                        _controller.forward();
                        setState(() {
                          isPlay = true;
                        });
                      } else {
                        _controller.reverse();
                        setState(() {
                          isPlay = false;
                        });
                      }
                    },
                    child: AnimatedIcon(
                      icon: AnimatedIcons.close_menu,
                      progress: _controller,
                      size: 100,
                    )),
                TextButton(
                    onPressed: () {
                      addItem();
                    },
                    child: Text("Add")),
                Expanded(
                  child: AnimatedList(
                      key: listKey,
                      initialItemCount: 0,
                      itemBuilder: ((context, index, animation) {
                        return SizeTransition(
                            sizeFactor: animation,
                            key: UniqueKey(),
                            child: Card(
                              child: ListTile(
                                title: Text(item[index]),
                                trailing: TextButton(
                                  onPressed: () {
                                    deleteItem(index);
                                  },
                                  child: Text("delete"),
                                ),
                              ),
                            ));
                      })),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      count += 1;
                    });
                  },
                  child: Text("Add"),
                ),
                AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  key: ValueKey(count),
                  child: Text(count.toString()),
                  transitionBuilder: (child, Animation<double> animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                ),
                
                AnimatedList(
                  initialItemCount: 0,
                  key: listKey,
                  itemBuilder: (context, index, animation) {
                  return SizeTransition(sizeFactor: animation,child: Card(
                    key: UniqueKey(),
                  ),);
                },)
              ],
            ),
          ),
        ));
  }
}

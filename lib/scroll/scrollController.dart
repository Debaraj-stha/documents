import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class scroll extends StatefulWidget {
  const scroll({super.key});

  @override
  State<scroll> createState() => _scrollState();
}

class _scrollState extends State<scroll> with TickerProviderStateMixin {
  late final ScrollController controller = ScrollController();
  double offset = 0;
  late ValueNotifier<String> msg;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    msg = ValueNotifier<String>("none");
    // msg.value="none";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        icon: Icon(Icons.arrow_upward),
        onPressed: () {
          controller.animateTo(0,
              duration: Duration(seconds: 1), curve: Curves.bounceIn);
        },
      ),
      appBar: AppBar(
          title: ValueListenableBuilder(
        valueListenable: msg,
        builder: (context, value, _) {
          return Text(value);
        },
      )),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification) {
            if (ScrollNotification is ScrollStartNotification) {
              msg.value = "scroll started";
            }
            if (ScrollNotification is ScrollUpdateNotification) {
              msg.value = "scroll updated";
            }
            if (ScrollNotification is ScrollEndNotification) {
              msg.value = "scroll ended";
            }
            return true;
          },
          child: ListView.builder(
            controller: controller,
            itemBuilder: ((context, index) {
              if (index == -0) {
                return IconButton(
                    onPressed: () {
                      final end = controller.position.maxScrollExtent;
                      controller.animateTo(end,
                          duration: Duration(seconds: 1),
                          curve: Curves.bounceIn);
                    },
                    icon: Icon(Icons.arrow_downward));
              }
              return ListTile(
                title: Text("Item $index"),
              );
            }),
            itemCount: 30,
          ),
        ),
      ),
    );
  }
}

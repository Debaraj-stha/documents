import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_all/userList.dart';

class scalePageView extends StatefulWidget {
  const scalePageView({super.key});

  @override
  State<scalePageView> createState() => _scalePageViewState();
}

class _scalePageViewState extends State<scalePageView> {
  late final PageController controller=PageController(viewportFraction: 0.8);
  double pageValue=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        pageValue=controller.page!;
      });
     });
    //  print(pageValue.toString());
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: 200,
          width: 280,
          color: Colors.green,
          child: PageView.builder(
                controller: controller,
                itemCount: 10,
                itemBuilder: (context,i){
                  if(i==pageValue.floor()){
                    return  Container(
                      width: 180,
                    color: i.isEven?Colors.red:Colors.blue,
                    child: Center(
                      child: Text("Page $i"),
                    ),
                  );
                  }
                  else{
                    return Transform.scale(
                      scale: 0.8,
                      child: Container(
                    color: i.isEven?Colors.red:Colors.blue,
                    child: Center(
                      child: Text("Page $i"),
                    ),
                  ),
                    );
                  }
              }),
        ),
      ),
    );
  }
}
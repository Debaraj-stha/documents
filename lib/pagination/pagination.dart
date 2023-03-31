import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:number_paginator/number_paginator.dart';

class pagination extends StatefulWidget {
  const pagination({super.key});

  @override
  State<pagination> createState() => _paginationState();
}

class _paginationState extends State<pagination> {
  List<String> item=[
    "Ram Shrestha",
    "Ram Shrestha",
    "Ram Shrestha",
    "Ram Shrestha",
    "Ram Shrestha",
    "Ram Shrestha",
    "Hari Shrestha",
    "Ram Shrestha",
    "Ramssksm ssjShrestha",
    "Ram Shrestha",
    "ssksm  sRam Shrestha",
    "Ram Shresnsjjsjsssstha",
    "Ram Shsjsjsjrestha",
    "Ram Ssgsgshrestha",
    "Ram Shrestha",
    "Ram Shrestha",
    "Ram Shrestha",
  ];
  List pages=[];
  int currentPage=0;
  late final NumberPaginatorController controller = NumberPaginatorController();
   
 late final  PageController _controller= PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    page();
  }
  void page(){
   pages=List.generate((item.length/4).ceil(), (index){
    return item.sublist(index*3,(index+1)*3);
   });
   setState(() {
     
   });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children:[
          Container(
            height: 400,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage=value;
                });
              },
              itemCount: pages.length,
              itemBuilder: (context,index){
              final pageData=pages[index];
              return Expanded(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: pageData.length,
                  itemBuilder: (context,index){
                  final data=pageData[index];
                  return ListTile(title: Text(data),);
                }),
              );
            }),
          ),
              NumberPaginator(
              controller: controller,
              config: NumberPaginatorUIConfig(
                buttonSelectedBackgroundColor: Colors.blue,
                buttonSelectedForegroundColor: Colors.white,
                buttonUnselectedBackgroundColor: Colors.black,
                buttonUnselectedForegroundColor: Colors.white,
                buttonShape: BeveledRectangleBorder()
              ),
              numberPages: pages.length,
              initialPage: 0,
              // numberPagesVisible: 5,
              // currentPage:currentPage,
              // initialPage: (currentPage - 1).clamp(0, _pages.length - 1),
              onPageChange: (int c){
              _controller.nextPage(duration: Duration(seconds: 1), curve:Curves.easeIn);
                setState(() {
                  currentPage=c+1;
                  
                });
              }
          ),
        NumberPaginator(
          numberPages: pages.length,
          initialPage: 0,
          
          controller:controller ,
          onPageChange: (int p0) {
            _controller.nextPage(duration: Duration(seconds: 1), curve: Curves.bounceIn);
            setState(() {
              currentPage=p0+1;
            });
          },
          )
        ]
      )
    );
  }
}
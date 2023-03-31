import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_all/controller/dbcontroller.dart';

import 'model/a.dart';

class userList extends StatefulWidget {
  const userList({super.key});

  @override
  State<userList> createState() => _userListState();
}

class _userListState extends State<userList> {
  @override
  late dbController controller;
    late final Future<List<a>> myUser;
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = dbController();
    
    loadData();
  }




  loadData() async {
    myUser = controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<a>>(
          future: myUser,
          builder: (context,snapshot) {
               if (snapshot.connectionState==ConnectionState.done) {
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: ((context, i) {
                  // print(snapshot.data![i].name);
                  return Dismissible(
                    key: Key(i.toString()),
                    child: ListTile(
                      title: Text(snapshot.data![i].name),
                      subtitle: Text(snapshot.data![i].address),
                    ),
                    background: Container(
                      color: Colors.red,
                      child: Icon(Icons.remove),
                    ),
                    onDismissed: (direction){
                      if(direction==DismissDirection.startToEnd){
                        controller.deleteData(snapshot.data![i].id ?? i);
                      }
                    },
                  );
                }),
                itemCount: snapshot.data!.length,
              );
            }
         else   if (snapshot.hasError) {
              return Text("Errors ${snapshot.error}");
            }
           else if(snapshot.connectionState==ConnectionState.waiting){
            return CircularProgressIndicator();
           }
            else{
            return Text("no data available");
            }
          }),
    );
  }
}

void print(s) {
  print(s);
}


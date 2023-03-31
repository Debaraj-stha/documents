import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all/insertr.dart';
import 'package:flutter_all/loginWithPhone.dart';
import 'package:flutter_all/slidePannel.dart';
import 'package:flutter_all/userList.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController controller = TextEditingController();
  final ref = FirebaseDatabase.instance.ref('Post');
  final firestore = FirebaseFirestore.instance.collection("post");
  final firestoreSnapshot =
      FirebaseFirestore.instance.collection("post").snapshots();
  void addList() {
    final String id = DateTime.now().microsecondsSinceEpoch.toString();
    ref.child(id).set({'id': 1}).then((_) {
      // print('Transaction completed successfully.');
    }).catchError((error) {
      // print('Transaction failed: $error');
    });
  }

  int currentIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () async {
                await auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => slidePannel()));
              },
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            // Stepper(
            //   currentStep: currentIndex,
            //   controlsBuilder: (context, details) {
            //     return Row(
            //       children: [
            //         if (currentIndex > 0)
            //           ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //               primary: Colors
            //                   .red, // Set the background color of the cancel button
            //             ),
            //             onPressed: () {
            //               if (currentIndex == 0) {
            //                 return;
            //               }
            //               setState(() {
            //                 currentIndex -= 1;
            //               });
            //             },
            //             child: Text('Cancel'),
            //           ),
            //         Spacer(),
            //         if (currentIndex < 3)
            //           ElevatedButton(
            //             onPressed: () {
            //               if (currentIndex == 3) {
            //                 return;
            //               } else {
            //                 setState(() {
            //                   currentIndex += 1;
            //                 });
            //               }
            //             },
            //             child: Text('Continue'),
            //           ),
            //         if (currentIndex == 3)
            //           ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //               primary: Colors
            //                   .green, // Set the background color of the continue button
            //             ),
            //             onPressed: () {
            //               if (currentIndex == 3) {
            //                 return;
            //               } else {
            //                 setState(() {
            //                   currentIndex += 1;
            //                 });
            //               }
            //             },
            //             child: Text('Next'),
            //           ),
            //       ],
            //     );
            //   },
            //   steps: [
            //     Step(
            //         state: StepState.editing,
            //         isActive: currentIndex == 0,
            //         title: Text("step title"),
            //         content: Text("step content")),
            //     Step(
            //         isActive: currentIndex == 1,
            //         state: StepState.editing,
            //         title: Text("step title"),
            //         content: Text("step content")),
            //     Step(
            //         isActive: currentIndex == 2,
            //         state: StepState.editing,
            //         title: Text("step title"),
            //         content: Text("step content")),
            //     Step(
            //         isActive: currentIndex == 3,
            //         state: StepState.complete,
            //         title: Text("step title"),
            //         content: Text("step content")),
            //   ],
            //   onStepTapped: (index) {
            //     currentIndex = index;
            //   },
            //   onStepContinue: () {
            //     if (currentIndex == 3) {
            //       return;
            //     } else {
            //       setState(() {
            //         currentIndex += 1;
            //       });
            //     }
            //   },
            //   onStepCancel: () {
            //     if (currentIndex == 0) {
            //       return;
            //     }
            //     setState(() {
            //       currentIndex -= 1;
            //     });
            //   },
            // ),
            // loginWithPhone(),
            // TextButton(
            //     onPressed: () async {
            //       try {
            //         final LoginResult result =
            //             await FacebookAuth.instance.login();
            //         switch (result.status) {
            //           case LoginStatus.success:
            //             final AuthCredential facebookCredential =
            //                 FacebookAuthProvider.credential(
            //                     result.accessToken!.token);
            //             final UserCredential =
            //                 await auth.signInWithCredential(facebookCredential);
            //             break;
            //           case LoginStatus.cancelled:
            //             break;
            //           case LoginStatus.failed:
            //             break;
            //         }
            //       } on FirebaseAuthException catch (e) {
            //         throw new Exception("exception occured");
            //       }
            //     },
            //     child: Text("Login with facebook")),
            // TextButton(
            //   onPressed: () async {
            //     try {
            //       GoogleSignIn instance = GoogleSignIn();

            //       if (instance.clientId != null) {
            //         final signinResult = await instance.signIn();
            //         throw new Exception(signinResult);
            //         // final AuthCredential credential=GoogleAuthProvider.credential(signinResult.);
            //         // auth.signInWithCredential(credential);
            //       } else {
            //         throw new Exception("ew");
            //       }
            //     } catch (e) {
            //       throw new Exception("exception occ");
            //     }
            //   },
            //   child: Text("login with googlwe"),
            // ),
            userList(),
            insert(),
            /*
            TextFormField(
              controller: controller,
            ),
            TextButton(
                onPressed: () async {
                 
                  await firestore.add({"title":controller.text});
                },
                child: Text("add")),
            //realtime database data
            FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, i) {
                  return ListTile(
                    title: Text(snapshot.child('title').value.toString()),
                    trailing: TextButton(
                        onPressed: () {
                          ref
                              .child(snapshot.child('id').value.toString())
                              .remove();
                        },
                        child: Text("remove")),
                  );
                }),
            //firestore data
            Container(
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('post').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }

                  return Container(
                    height: 200,
                    child: ListView(
                      children: snapshot.data!.docs.map((document) {
                        return Container(
                            child: ListTile(
                          leading: TextButton(
                              onPressed: () {
                                firestore.doc(document.id).delete();
                              },
                              child: Text("delete")),
                          title: Text(document['title']),
                          trailing: TextButton(
                              onPressed: () {
                                firestore
                                    .doc(document.id)
                                    .update({"title": "updated title"});
                              },
                              child: Text("update")),
                          // subtitle: Text(document['name']),
                        ));
                      }).toList(),
                    ),
                  );
                },
              ),
            )
            */
          ],
        ));
  }
}

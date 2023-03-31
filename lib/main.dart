import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all/animation/animation2.dart';
import 'package:flutter_all/pagination/pagination.dart';
import 'package:flutter_all/scroll/pageview.dart';
import 'package:flutter_all/scroll/parallex.dart';
import 'package:flutter_all/scroll/scalePageview.dart';
import 'package:flutter_all/scroll/scrollController.dart';
// import 'package:flutter_all/call/call.dart';
import 'package:flutter_all/slidePannel.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'clip/clip.dart';
import 'package:flutter_all/video.dart';
import 'firebase/uploadImage.dart';

void main()async {
//  FlutterDownloader.initialize();
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
FirebaseDatabase.instance.setLoggingEnabled(true);
//  ZegoUikitSignalingPlugin.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:video(title: 'webrtc',),
    );
  }
}


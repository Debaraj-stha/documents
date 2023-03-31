import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_all/userList.dart';
import 'package:image_picker/image_picker.dart';

class uploadImage extends StatefulWidget {
  const uploadImage({super.key});

  @override
  State<uploadImage> createState() => _uploadImageState();
}

class _uploadImageState extends State<uploadImage> {
  File? file;
  Future pickImage(ImageSource s) async {
    final image = await ImagePicker().pickImage(source: s);
    if (image != null) {
      file = File(image.path);
      setState(() {});
    } else {
      throw new Exception("exception occured");
    }
  }

  Future<void>uploadImage() async {
  
    // firebase_storage.FirebaseStorage storage =
    //     firebase_storage.FirebaseStorage.instance;

    // firebase_storage.Reference reference =
    //     firebase_storage.FirebaseStorage.instance.ref('/image');
    // firebase_storage.UploadTask uploadTask = reference.putFile(file!.absolute);
    // await Future.value(uploadTask);
    // var newUrl = reference.getDownloadURL();
    // print(newUrl);
    firebase_storage.FirebaseStorage storage=await firebase_storage.FirebaseStorage.instance;
    firebase_storage.Reference reference=firebase_storage.FirebaseStorage.instance.ref("/image");
    firebase_storage.UploadTask uploadTask = reference.putFile(file!.absolute);
    var url=reference.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 38.0),
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                pickImage(ImageSource.camera);
              },
              child: Text("Camera")),
          TextButton(
              onPressed: () {
                pickImage(ImageSource.gallery);
              },
              child: Text("Gallery")),
          TextButton(
            onPressed: () {
              if (file != null) {
                uploadImage();
              } else {
              print("null filke");
              }
            },
            child: Text("Upload"),
          ),
          file != null ? Image.file(file!) : Icon(Icons.image)
        ],
      ),
    ));
  }
}

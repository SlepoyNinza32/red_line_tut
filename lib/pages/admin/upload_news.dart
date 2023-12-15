import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:red_line_tut/model/news_model.dart';

class Upload_News extends StatefulWidget {
  const Upload_News({super.key});

  @override
  State<Upload_News> createState() => _Upload_NewsState();
}

class _Upload_NewsState extends State<Upload_News> {
  PlatformFile? pickedFile;
  var imageUrl;

  Future selectImage() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

  CollectionReference news = FirebaseFirestore.instance.collection("news");

  Future uploadImage() async {
    final path = pickedFile!.name;
    File file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    await ref.putFile(file).then((p0) async {
      imageUrl = await FirebaseStorage.instance
          .ref()
          .child(pickedFile?.name ?? "")
          .getData();
      news.add({
        News(
            title: titleContr.text,
            text: textContr.text,
            time: timeContr.text,
            imageUrl: imageUrl)
      });
    });
  }

  TextEditingController titleContr = TextEditingController();
  TextEditingController textContr = TextEditingController();
  TextEditingController timeContr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: titleContr,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Title"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textContr,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Text"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: timeContr,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Time"),
            ),
          ),
          if (pickedFile != null)
            Expanded(
                child: Container(
              color: Colors.blue[100],
              child: Image.file(
                File(pickedFile!.path!),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )),
          MaterialButton(
            onPressed: () {
              selectImage();
            },
            child: Text("Upload image"),
          ),
          MaterialButton(
            onPressed: () {
              uploadImage().then((value) {});
            },
            child: Text("Publish"),
          )
        ],
      ),
    );
  }
}

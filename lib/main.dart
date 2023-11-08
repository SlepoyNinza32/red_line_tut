import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_line_tut/my_app.dart';
import 'FirebaseMethods.dart';
import 'firebase_options.dart';
import 'model/profile_model.dart';
import 'pages/pages.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<ProfileModel>(ProfileModelAdapter());
  Box<ProfileModel> box = await Hive.openBox<ProfileModel>('profile');
  bool have = box.get('profileKey')?.have ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: have == true ? MyApp() : FirstPage(),
    ),
  );
  FirebaseFirestore.instance
      .collection('users')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      print(doc.id);
    });
  });
}

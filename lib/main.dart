import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_line_tut/my_app.dart';
import 'package:red_line_tut/pages/admin/upload_news.dart';

import 'firebase_options.dart';
import 'model/users_model.dart';
import 'pages/admin/admin_page.dart';
import 'pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<UsersModel>(UsersModelAdapter());
  Hive.registerAdapter<CoursesModel>(CoursesModelAdapter());
  Box<UsersModel> box = await Hive.openBox<UsersModel>('profile');
  bool have = box.get('profileKey')?.isReg ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Upload_News()
      // have == true ? MyApp() : FirstPage(),
    ),
  );
  // FirebaseFirestore.instance
  //     .collection('users')
  //     .where('login', isEqualTo: 'aziz')
  //     .where('password', isEqualTo: 'aziz007')
  //     .get()
  //     .then((QuerySnapshot querySnapshot) {
  //   // querySnapshot.docs.forEach((doc) {
  //   //   print(doc["first_name"]);
  //   // });
  //   for (var m in querySnapshot.docs) {
  //     print(m.get('name'));
  //   }
  //   print(querySnapshot.docs.first.id);
  // });
}

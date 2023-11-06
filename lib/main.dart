import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_line_tut/my_app.dart';
import 'model/profile_model.dart';
import 'pages/pages.dart';

void main() async {
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
}

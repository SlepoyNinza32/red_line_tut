import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:red_line_tut/model/users_model.dart';

import 'firebase_options.dart';

// CollectionReference user = FirebaseFirestore.instance.collection('users');
//
// Future getData() async {
//   UsersModel model;
//   FirebaseFirestore.instance
//       .collection('users')
//       // .where('login', isEqualTo: 'aziz')
//       // .where('password', isEqualTo: 'aziz007')
//       .get()
//       .then((QuerySnapshot querySnapshot) {
//     // querySnapshot.docs.forEach((doc) {
//     //   print(doc["first_name"]);
//     // });
//     for (var m in querySnapshot.docs) {
//       print(m.get('name'));
//       users.add(UsersModel(login: m.get('login'), name: name, password: password, avatar: avatar, courses: courses, sex: sex, telephoneNumber: telephoneNumber))
//     }
//     // print(querySnapshot.docs.first.id);
//   });
// }

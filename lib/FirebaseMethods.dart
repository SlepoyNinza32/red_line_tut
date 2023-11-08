import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:red_line_tut/model/users_model.dart';

import 'firebase_options.dart';

CollectionReference user = FirebaseFirestore.instance.collection('users');

Future getData() async {
  List<UsersModel> users = await user.doc().snapshots().toList() as List<UsersModel>;
  print(users);
}

void main() async{

  getData();
}
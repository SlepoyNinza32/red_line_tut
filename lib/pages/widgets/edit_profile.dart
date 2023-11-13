import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:red_line_tut/pages/pages.dart';

import '../../model/users_model.dart';

class Edit_profile extends StatefulWidget {
  final int index;

  const Edit_profile({super.key, required this.index});

  @override
  State<Edit_profile> createState() => _Edit_profileState();
}

class _Edit_profileState extends State<Edit_profile> {
  TextEditingController txtcontr = TextEditingController();

  CollectionReference user = FirebaseFirestore.instance.collection('users');
  late Box<UsersModel> box;

  @override
  void initState() {
    super.initState();
    getBox();
  }

  void getBox() async {
    box = Hive.box('profile');
    if (widget.index == 0) {
      txtcontr.text = await box.get('profileKey')!.name;
    } else {
      txtcontr.text = await box.get('profileKey')!.about;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6969),
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.index == 0 ? "Edit nickname" : "Bio"),
        actions: [
          IconButton(
              onPressed: () {
                if (widget.index == 0 && txtcontr.text.length <= 20) {
                   user.doc(box.get('profileKey')!.key).update({
                    'name': txtcontr.value.text,
                  });
                  box.put(
                    "profileKey",
                    UsersModel(
                        login: box.get('profileKey')!.login,
                        name: txtcontr.value.text,
                        password: box.get('profileKey')!.password,
                        avatar: box.get('profileKey')!.avatar,
                        courses: box.get('profileKey')!.courses,
                        sex: box.get('profileKey')!.sex,
                        isReg: box.get('profileKey')!.isReg,
                        telephoneNumber: box.get('profileKey')!.telephoneNumber,
                        key: box.get('profileKey')!.key,
                        about: box.get('profileKey')!.about),
                  );
                   Navigator.pop(context);
                }
                if (widget.index == 0 && txtcontr.text.length > 20) {
                  print("error");
                }
                if (widget.index == 1 && txtcontr.text.length <= 200) {
                  user.doc(box.get('profileKey')?.key).update({
                    "about": txtcontr.value.text,
                  });
                  box.put(
                    "profileKey",
                    UsersModel(
                        login: box.get('profileKey')!.login,
                        name: box.get('profileKey')!.name,
                        password: box.get('profileKey')!.password,
                        avatar: box.get('profileKey')!.avatar,
                        courses: box.get('profileKey')!.courses,
                        sex: box.get('profileKey')!.sex,
                        isReg: box.get('profileKey')!.isReg,
                        telephoneNumber: box.get('profileKey')!.telephoneNumber,
                        key: box.get('profileKey')!.key,
                        about: txtcontr.value.text),
                  );
                  Navigator.pop(context);
                }
                if (widget.index == 1 && txtcontr.text.length > 200) {
                  print("error");
                }

              },
              icon: Icon(CupertinoIcons.check_mark))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: txtcontr,
              autofocus: true,
              decoration: InputDecoration(),
            ),
          ),
          Text(
            widget.index == 0
                ? "Your nickname can contain maximum 20 symbols"
                : "Your nickname can contain maximum 200 symbols",
          )
        ],
      ),
    );
  }
}

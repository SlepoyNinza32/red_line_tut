// import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_line_tut/pages/admin/students_list_page.dart';

import '../../model/admin_model.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<ListIdModel> gggl = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getIds();
    // print(
    // FirebaseFirestore.instance
    //     .collection('groups').snapshots().length);
  }

  Future<List<ListIdModel>> getIds() async {
    await FirebaseFirestore.instance
        .collection('groups')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var b in querySnapshot.docs) {
        // gggl.add(
        //   ListJsontoIdModel(
        //     FirebaseFirestore.instance.collection('groups').doc(b.id).get(),
        //   ),
        // );
        gggl.add(
          ListIdModel(
            students: b.get('students'),
            checkList: ListJsontoIdModel(b.get('checkList')),
            name: b.get('name'),
            teacher: b.get('teacher'),
            keyO: b.id,
          ),
        );
        // gggl.name = b.get('name');
        // gggl.teacher = b.get('teacher');
        // gggl.students = ListJsontoIdModel(b.get('students'));
      }
    });
    return gggl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6969),
        title: Text(
          'RedLine',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Color(0xFFFFF5E0),
      body: Container(
        child: FutureBuilder(
          future: getIds(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => StudentsListPage(
                            keyO: snapshot.data![index].keyO ?? 'Error',
                            nameOfGroup: snapshot.data![index].name ?? 'Error',
                            ind: index),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(18),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.11,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFD9D9D9),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${snapshot.data?[index].name}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              '${snapshot.data?[index].teacher}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: Color(0xFF141E46),
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                ),
                itemCount: snapshot.data?.length,
              );
            }
          },
        ),
      ),

    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late List<ListIdModel> gggl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<List<ListIdModel>> getIds() async {
    await FirebaseFirestore.instance
        .collection('groups')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var b in querySnapshot.docs) {
        gggl.add(
          ListIdModel(
            students: ListJsontoIdModel(
              b.get('students'),
            ),
            name: b.get('name'),
            teacher: b.get('teacher'),
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
      backgroundColor: Color(0xFFFFF5E0),
      body: Container(
        child: FutureBuilder(
            future: getIds(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.hasError) {
                print(snapshot.error);
                return CircularProgressIndicator();
              } else {
                return ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    title: Text('${snapshot.data?[index].name}'),
                  ),
                  itemCount: snapshot.data?.length,
                );
              }
            }),
      ),
    );
  }
}

class ListIdModel {
  // List<String>? ids;
  List<Student>? students;
  String? name, teacher;

  ListIdModel({
    // required this.ids,
    required this.students,
    required this.name,
    required this.teacher,
  });

  ListIdModel.fromJson(Map<String, dynamic> json) {
    students = json['students'];
    name = json['name'];
    teacher = json['teacher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['ids'] = ids;
    data['students'] = students;
    data['name'] = name;
    data['teacher'] = teacher;
    return data;
  }
}

class Student {
  String? name;
  bool? was;

  Student(this.name, this.was);

  Student.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    was = json['was'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['was'] = was;
    data['name'] = name;
    return data;
  }
}

ListJsontoIdModel(dynamic json) {
  return List<Student>.from(json.map((e) => Student.fromJson(e)));
}

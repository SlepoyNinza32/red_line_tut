import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:red_line_tut/model/admin_model.dart';

class StudentsListPage extends StatefulWidget {
  StudentsListPage(
      {super.key,
      required this.keyO,
      required this.nameOfGroup,
      required this.ind});

  String keyO, nameOfGroup;
  int ind;

  @override
  State<StudentsListPage> createState() => _StudentsListPageState();
}

class _StudentsListPageState extends State<StudentsListPage> {
  //List<Student> st = [];
  List<ListIdModel> gggl = [];
  List<CheckList> currentCheckList = [];

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
        //FirebaseFirestore.instance.collection('groups').doc('');
        // FirebaseFirestore.instance.collection('groups').doc('').update({'':''});
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
  void initState() {
    // TODO: implement initState
    super.initState();
    getIds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF5E0),
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6969),
        title: Text(
          '${widget.nameOfGroup}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
          future: getIds(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFD9D9D9),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${snapshot.data![widget.ind].students[index]}'),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              child: Icon(Icons.close),
                              onTap: () {
                                setState(() {
                                  bool has = false;
                                  for (var b in currentCheckList) {
                                    if (snapshot
                                        .data![widget.ind].students[index] ==
                                        b.name) {
                                      has = true;
                                      b.was = false;
                                    }
                                  }
                                  if (has == false) {
                                    currentCheckList.add(
                                      CheckList(
                                        name: snapshot
                                            .data![widget.ind].students[index],
                                        was: false,
                                        day:
                                        '${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}',
                                      ),
                                    );
                                  }
                                });
                              },
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  bool has = false;
                                  for(var b in currentCheckList){
                                    if(snapshot.data![widget.ind].students[index] == b.name){
                                      has = true;
                                      b.was = true;
                                    }
                                  }
                                  if(has == false){
                                    currentCheckList.add(
                                      CheckList(
                                        name: snapshot
                                            .data![widget.ind].students[index],
                                        was: true,
                                        day:
                                        '${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}',
                                      ),
                                    );
                                  }
                                });
                              },
                              child: Icon(Icons.check),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                itemCount: snapshot.data![widget.ind].students.length,
              );
            }
          }),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 1,
              width: 1,
            ),
            InkWell(
              onTap: () {
                print(currentCheckList);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.brown[600],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Share',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

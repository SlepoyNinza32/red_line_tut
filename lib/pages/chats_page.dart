import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_line_tut/pages/widgets/bottom_nav_bar.dart';

import 'chatting_page.dart';
import 'main_page.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: BottomNavBar(context, 1),
      backgroundColor: Color(0xFFFFF5E0),
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
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onLongPress: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ChattingPage(),
                  ));
            },
            tileColor: Color(0xFFD9D9D9),
            focusColor: Color(0xFFD9D9D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(
              'Name of Course',
              style: TextStyle(
                color: Color(0xff141E46),
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),
            ),
            subtitle: Text(
              'Name of Course Teacher',
              style: TextStyle(
                color: Color(0xff141E46),
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  border: Border.all(
                    color: Color(0xFF141E46),
                    width: 2,
                  ),
                  color: Color(0xffFFF5E0)),
              child: Icon(
                Icons.people_alt,
                color: Color(0xff141E46),
                weight: 43,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


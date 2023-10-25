import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        child: BottomNavigationBar(
          //fixedColor: Color(0xFF141E46),
          currentIndex: 1,

          iconSize: 35,
          selectedItemColor: Color(0xFFFF6969),
          unselectedItemColor: Color(0xFFFFF5E0),
          //backgroundColor: Color(0xFF141E46),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF141E46),
              label: 'home',
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF141E46),
              label: 'chats',
              icon: Icon(
                Icons.wechat_sharp,
              ),
            ),
            BottomNavigationBarItem(
              label: 'nothing',
              icon: Icon(
                Icons.add_circle_outline,
              ),
            ),
            BottomNavigationBarItem(
              label: 'statics',
              icon: Icon(
                Icons.insert_chart_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: 'profile',
              icon: Icon(
                Icons.person,
              ),
            ),
          ],
          onTap: (value) {
            if (value == 0) {
              Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => MainPage(),
                  ));
            } else if (value == 1) {
              Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ChatsPage(),
                  ));
            } else if (value == 2) {
              // Navigator.push(
              //     context,
              //     CupertinoPageRoute(
              //       builder: (context) => MainPage(),
              //     ));
              setState(() {});
            } else if (value == 3) {
              Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => MainPage(),
                  ));
            } else if (value == 4) {
              Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => MainPage(),
                  ));
            }
          },
        ),
      ),
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


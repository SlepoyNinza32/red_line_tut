import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_line_tut/profile_page.dart';

import 'chats_page.dart';
import 'main_page.dart';

Widget BottomNavBar(BuildContext context, int currentI) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
    ),
    child: BottomNavigationBar(
      //fixedColor: Color(0xFF141E46),
      currentIndex: currentI,

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
          backgroundColor: Color(0xFF141E46),
          label: 'nothing',
          icon: Icon(
            Icons.add_circle_outline,
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Color(0xFF141E46),
          label: 'statics',
          icon: Icon(
            Icons.insert_chart_outlined,
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Color(0xFF141E46),
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
                builder: (context) => ProfilePage(),
              ));
        }
      },
    ),
  );
}

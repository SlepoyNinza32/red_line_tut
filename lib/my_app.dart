import 'package:flutter/material.dart';
import 'package:red_line_tut/generated/assets.dart';
import 'package:red_line_tut/pages/admin/admin_page.dart';
import 'package:red_line_tut/pages/chats_page.dart';
import 'package:red_line_tut/pages/main_page.dart';
import 'package:red_line_tut/pages/pages.dart';
import 'package:rive/rive.dart';

import 'rive_utils.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavs[currentIndex].page,
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          //margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Color(0xFF141E46),
            // borderRadius: BorderRadius.all(
            //   Radius.circular(24),
            // ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                bottomNavs.length,
                (index) => GestureDetector(
                  onTap: () {

                    bottomNavs[index].input!.change(true);
                    Future.delayed(
                      Duration(milliseconds: 500),
                      () {
                        setState(() {
                          currentIndex = index;
                        });
                        bottomNavs[index].input!.change(false);
                      },
                    );
                    //searchTrigger.change(false);
                  },
                  child: SizedBox(
                    height: 36,
                    width: 36,
                    child: RiveAnimation.asset(
                      bottomNavs[index].src,
                      artboard: bottomNavs[index].artboard,
                      onInit: (artboard) {
                        StateMachineController controller =
                            RiveUtils.getRiveController(artboard,
                                stateMachineName:
                                    bottomNavs[index].stateMachineName);
                        bottomNavs[index].input =
                            controller.findSMI('active') as SMIBool;
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;
  final Widget page;

  RiveAsset(this.src,
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      required this.page,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset(Assets.riveAssetsIcons,
      artboard: "HOME",
      stateMachineName: "HOME_interactivity",
      title: "Home",
      page: MainPage(),),
  RiveAsset(Assets.riveAssetsIcons,
      artboard: "CHAT",
      stateMachineName: "CHAT_Interactivity",
      title: "Chat",
      page: ChatsPage(),),
  RiveAsset(Assets.riveAssetsIcons,
    artboard: "HOME",
    stateMachineName: "HOME_interactivity",
    title: "Home",
    page: MainPage(),),
  RiveAsset(Assets.riveAssetsIcons,
      artboard: "LIKE/STAR",
      stateMachineName: "STAR_Interactivity",
      title: "Star",
      page: AdminPage(),),
  RiveAsset(Assets.riveAssetsIcons,
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
      title: "Profile",
      page: ProfilePage(),),
];

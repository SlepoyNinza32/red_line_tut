import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:red_line_tut/generated/assets.dart';
import 'package:red_line_tut/my_app.dart';
import 'package:red_line_tut/rive_utils.dart';
import 'package:rive/rive.dart';

import '../model/profile_model.dart';
import 'login_page.dart';
import 'main_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController loginContr = TextEditingController();
  TextEditingController passwordContr = TextEditingController();

  bool isVisible = true;

  // late SMIBool searchTrigger;
  late Box<ProfileModel> box;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    box = Hive.box('profile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: RiveAnimation.asset(
              Assets.riveAssetsBackgroundLogin,
              fit: BoxFit.cover,
              onInit: (artboard) {
                // StateMachineController con = RiveUtils.getRiveController(artboard);
                // searchTrigger = con.findSMI('active') as SMIBool;
                //
                // searchTrigger.change(true);
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Learn \nDesign \n& Code",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 50,
                            color: Colors.white),
                      ),
                      Text(
                        "Don't skip design. Learn design and\ncode,by building real apps with Flutter\n and Swift.Complete courses abut the\nbest tools",
                        style:
                            TextStyle(fontFamily: "Inter", color: Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(23)),
                            elevation: 1,
                            title: Text('Login'),
                            actions: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(23),
                                child: MaterialButton(
                                  onPressed: () {
                                    box.put(
                                        'profileKey',
                                        ProfileModel(
                                            true,
                                            loginContr.value.text,
                                            passwordContr.value.text));
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyApp(),
                                        ));
                                  },
                                  child: Container(
                                    // width: MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Let's go!",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontFamily: "EBG")),
                                      ],
                                    ),
                                  ),
                                  color: Color(0xFFFF785B),
                                ),
                              ),
                            ],
                            content: StatefulBuilder(builder: (BuildContext context,StateSetter setState1){
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: TextField(
                                      controller: loginContr,
                                      decoration: const InputDecoration(
                                          labelText: "Login",
                                          border: OutlineInputBorder(
                                              gapPadding: 20,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: TextField(
                                      controller: passwordContr,
                                      obscureText: isVisible,
                                      decoration: InputDecoration(
                                          suffixIconColor: Colors.black54,
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                print(isVisible);
                                                setState1(() {
                                                  if (isVisible != false) {
                                                    isVisible = false;
                                                  } else {
                                                    isVisible = true;
                                                  }
                                                });
                                              },
                                              icon: Icon(isVisible == false
                                                  ? Icons.visibility
                                                  : Icons.visibility_off)),
                                          labelText: "Password",
                                          border: const OutlineInputBorder(
                                              gapPadding: 20,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)))),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                        );
                      },
                      color: Colors.white,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Next->",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

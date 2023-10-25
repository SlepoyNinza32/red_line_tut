import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../model/profile_model.dart';
import 'main_page.dart';

// import 'main.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController loginContr = TextEditingController();
  TextEditingController passwordContr = TextEditingController();

  bool Isvisibile = true;
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
      backgroundColor: Color(0xFFFBEDEA),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Image.asset(
            "assets/Red Line.png",
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          const Text(
            "Login",
            style: TextStyle(fontSize: 40, fontFamily: "EBG"),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: loginContr,
              decoration: const InputDecoration(
                  labelText: "Login",
                  border: OutlineInputBorder(
                      gapPadding: 20,
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: passwordContr,
              obscureText: Isvisibile,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (Isvisibile == false) {
                          Isvisibile = true;
                        } else {
                          Isvisibile = false;
                        }
                        setState(() {});
                      },
                      icon: Icon(Isvisibile == true
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  labelText: "Password",
                  border: OutlineInputBorder(
                      gapPadding: 20,
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: MaterialButton(
                onPressed: () {
                  // if (loginContr.value.text != "" &&
                  //     passwordContr.value.text != "") {
                  //   // SharedPreferences pref =
                  //   // await SharedPreferences.getInstance();
                  //   // text = await pref.setBool('txt', true);
                  //
                  //   // Information information = Information(
                  //       name: loginContr.value.text,
                  //       password: passwordContr.value.text,
                  //       email: "example@gmail.com",
                  //       date_of_birth: "00-00-0000",
                  //       address: "-");
                  //   box.add(information);  print(box.get("info"));
                  box.put('profileKey',ProfileModel(true, loginContr.value.text, passwordContr.value.text));
                  Navigator.pushReplacement(
                      context, CupertinoPageRoute(builder: (_) => MainPage()));
                  //} else {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(content: Text("All fields must be filled")));
                  //   SharedPreferences pref =
                  //   await SharedPreferences.getInstance();
                  //   text = await pref.setBool('txt', false);
                  // }
                },
                color: Color(0xFFFF785B),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Let's go!",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "EBG")),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

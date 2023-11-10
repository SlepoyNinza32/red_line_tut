import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:red_line_tut/pages/widgets/edit_profile.dart';

import '../model/users_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Box<UsersModel> box;

  @override
  void initState() {
    super.initState();
    box = Hive.box('profile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF5E0),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://static.wikia.nocookie.net/jujutsu-kaisen/images/5/5a/Satoru_Gojo_arrives_on_the_battlefield_%28Anime%29.png/revision/latest?cb=20210226205256"),
                  fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                Positioned(
                    right: 0,
                    top: MediaQuery.of(context).size.height * 0.02,
                    child: PopupMenuButton<String>(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (_) => Edit_profile(index: 0)));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.edit),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Edit Name")
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.exit_to_app),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Sign Out")
                              ],
                            ),
                          )
                        ];
                      },
                    )),
                Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.01,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.04),
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${box.get('profileKey')?.name}",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          Text("Online",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 14))
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, top: 8),
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height * 0.31,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Account",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue[500],
                            fontWeight: FontWeight.w500),
                      ),
                      Text("+998 ${box.get('profileKey')?.telephoneNumber}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      Text("Your phone number",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.2,
                  height: 2,
                  color: Colors.black,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${box.get('profileKey')?.login}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text("Username ",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.2,
                  height: 2,
                  color: Colors.black,
                ),
                MaterialButton(
                  padding:EdgeInsets.zero ,
                  onPressed: (){Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (_) => Edit_profile(index: 1)));},
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${box.get('profileKey')?.about}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Add a few words about yourself(Bio)",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

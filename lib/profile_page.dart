import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(context, 4),
        backgroundColor: Color(0xFFFFF5E0),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://oyster.ignimgs.com/wordpress/stg.ign.com/2021/02/jujutsu-2.jpg"),
                      fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: MediaQuery.of(context).size.height * 0.02,
                    child: PopupMenuButton<int>(
                      itemBuilder: (context) => [
                        // popupmenu item 1
                        PopupMenuItem(
                          value: 1, // row has two child icon and text.
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
                          value: 2,
                          child: Row(
                            children: [
                              Icon(Icons.exit_to_app),
                              SizedBox(
                                // sized box with width 10
                                width: 10,
                              ),
                              Text("Sign Out")
                            ],
                          ),
                        ),
                      ],
                      offset: Offset(0, 100),
                      color: Colors.white,
                      elevation: 2,
                    ),
                  ),
                  Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.01,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.04),
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Yuji",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            Text("Online",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12))
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 8),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.31,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Account",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue[500],
                              fontWeight: FontWeight.w500),
                        ),
                        Text("+998(93)454-01-26",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        Text("Tap to change number",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 0.2,
                    height: 1,
                    color: Colors.black,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "@king_nedalord",
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
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bio",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text("Add a few words about yourself(Bio)",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

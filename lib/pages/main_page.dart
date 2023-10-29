import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages.dart';
import 'widgets/bottom_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double y = 500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(context, 0),
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
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(8),
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.95,
                        decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(23),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Cost of Course',
                              style: TextStyle(
                                color: Color(0xFF141E46),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'name of course',
                              style: TextStyle(
                                color: Color(0xFF141E46),
                                fontSize: 21,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.task_alt,
                                weight: 60,
                                color: Color(0xFF141E46),
                              ),
                              Text(
                                'Tasks\n for everyday',
                                style: TextStyle(
                                  color: Color(0xFF141E46),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.book_outlined,
                                weight: 60,
                                color: Color(0xFF141E46),
                              ),
                              Text(
                                'Material\nfor everyday',
                                style: TextStyle(
                                  color: Color(0xFF141E46),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            top: y,
            child: GestureDetector(
              onPanUpdate: (value) {
                setState(() {
                  //x = x + value.delta.dx;
                  //y = y + value.delta.dy;
                  y = y + value.delta.dy;
                });
              },
              onPanEnd: (value) {
                setState(() {
                  if (y >= MediaQuery.of(context).size.height * 0.5) {
                    y = MediaQuery.of(context).size.height * 0.41;
                  } else if (y < MediaQuery.of(context).size.height * 0.5) {
                    y = 0;
                  }
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.01,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Color(0xff141E46),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Card(
                            child: Column(),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(36)),
                            ),
                          ),
                        ),
                        itemCount: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            duration: Duration(
              milliseconds: 500,
            ),
          ),
        ],
      ),
    );
  }
}

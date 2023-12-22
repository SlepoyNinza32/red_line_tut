import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:red_line_tut/model/news_model.dart';
import '../model/users_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double y = 315;
  late Box<UsersModel> box;
  late Box<News> news;

  @override
  void initState() {
    super.initState();
    box = Hive.box('profile');
    news = Hive.box('news');
  }

  Future<List<News>> getNews() async {
    List<News> news = [];

    await FirebaseFirestore.instance
        .collection("news")
        .get()
        .then((QuerySnapshot querysnapshot) {
      for (var m in querysnapshot.docs) {
        news.add(
          News(
            text: m.get('text'),
            time: m.get('time'),
            title: m.get('title'),
            imageUrl: m.get('imageUrl'),
          ),
        );
      }
    });
    return news;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavBar(context, 0),
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
                      physics: PageScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: box.get('profileKey')!.courses.length,
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
                              '${box.get('profileKey')?.courses[index].balance.toString()} / ${box.get('profileKey')?.courses[index].costOfCourse.toString()}',
                              style: TextStyle(
                                color: Color(0xFF141E46),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '${box.get('profileKey')!.courses[index].nameCourse} by ${box.get('profileKey')!.courses[index].tutor}',
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
                      child: FutureBuilder(
                        future: getNews(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError || !snapshot.hasData) {
                            return ListView.builder(
                                  itemBuilder: (context, index) => Container(
                                    margin: EdgeInsets.symmetric(horizontal: 6),
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    child: Card(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding:
                                                EdgeInsets.only(right: 8.0),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.23,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              // Image border
                                              child: SizedBox.fromSize(
                                                size: Size.fromRadius(30),
                                                // Image radius
                                                child: Image.asset(
                                                    "assets/rishtan.jpg",
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 8.0),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.23,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  news.getAt(index)!.title,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Text(
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  news.getAt(index)!.text,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(36)),
                                      ),
                                    ),
                                  ),
                                  itemCount: news.length,
                                );

                          } else {
                            return ListView.builder(
                              itemBuilder: (context, index) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 6),
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: InkWell(
                                  onTap: () {
                                    showBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: MediaQuery.of(context).size.height,
                                          width: MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.only(left: 10,right: 10),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  snapshot.data![index].title,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 30),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  snapshot.data![index].text,
                                                  style: TextStyle(fontSize: 20),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Card(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(right: 8.0),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.23,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            // Image border
                                            child: SizedBox.fromSize(
                                              size: Size.fromRadius(30),
                                              // Image radius
                                              child: Image.network(
                                                  snapshot
                                                      .data![index].imageUrl,
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 8.0),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.23,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                snapshot.data![index].title,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                snapshot.data![index].text,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(36)),
                                    ),
                                  ),
                                ),
                              ),
                              itemCount: snapshot.data?.length,
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 150,
                    ),
                  ],
                ),
              ),
            ),
            duration: Duration(
              milliseconds: 300,
            ),
          ),
        ],
      ),
    );
  }
}

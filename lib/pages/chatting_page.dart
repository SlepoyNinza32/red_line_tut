import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChattingPage extends StatefulWidget {
  const ChattingPage({super.key});

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFFFFF5E0),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        leadingWidth: 65,
        leading: Container(
          margin: EdgeInsets.all(4),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          // border: Border.all(
          //   color: Color(0xFF141E46),              //   width: 2,
          // ),              color: Color(0xffFFF5E0)),
          child: Icon(
            Icons.people_alt,
            color: Color(0xff141E46),
            weight: 43,
          ),
        ),
        backgroundColor: Color(0xFFFF6969),
        title: Column(
          children: [
            Text(
              'Name of Course',
              style: TextStyle(
                color: Color(0xff141E46),
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              'Name of Course Teacher',
              style: TextStyle(
                color: Color(0xffD9D9D9),
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        reverse: true,
        itemCount: 3,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 30,
            width: 30,
            color: Colors.blue,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFF141E46),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.06,
        child: CupertinoTextField(
          controller: messageController,
          obscuringCharacter: 'Message',
          suffix: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.send,
                color: Color(0xFFD9D9D9),
              )),
        ),
      ),
    );
  }
}

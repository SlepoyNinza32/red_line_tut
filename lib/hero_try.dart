import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: const Hero_try(),
//   ));
// }

class Hero_try extends StatefulWidget {
  const Hero_try({super.key});

  @override
  State<Hero_try> createState() => _Hero_tryState();
}

class _Hero_tryState extends State<Hero_try> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(seconds: 3),
                pageBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                    ) {
                  return Scaffold(
                    body: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(seconds: 3),
                            pageBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                ) {
                              return Hero_try();
                            },
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'abc',
                        child: Container(
                          width: 60,
                          height: 60,
                          child: Icon(Icons.abc),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          child: Hero(
            tag: 'abc',
            child: Container(
              width: 60,
              height: 60,
              child: Icon(Icons.abc),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:hive/hive.dart';

class News {
  String title;
  String text;
  String time;
  String imageUrl;

  News(
      {required this.title,
      required this.text,
      required this.time,
      required this.imageUrl});
}

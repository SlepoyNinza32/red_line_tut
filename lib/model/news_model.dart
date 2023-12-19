import 'package:hive/hive.dart';
part 'news_model.g.dart';
@HiveType(typeId: 3)
class News{
  @HiveField(0)
  String title;
  @HiveField(1)
  String text;
  @HiveField(2)
  String time;
  @HiveField(3)
  String imageUrl;


  News({required this.title,required this.text,required this.time,required this.imageUrl});
}


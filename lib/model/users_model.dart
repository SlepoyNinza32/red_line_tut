import 'package:hive/hive.dart';

part 'users_model.g.dart';

@HiveType(typeId: 0)
class UsersModel {
  @HiveField(0)
  String login;
  @HiveField(1)
  String name;
  @HiveField(2)
  String password;
  @HiveField(3)
  String avatar;
  @HiveField(4)
  List<dynamic> courses;
  @HiveField(5)
  bool sex;
  @HiveField(6)
  bool isReg = false;
  @HiveField(7)
  int telephoneNumber;
  @HiveField(8)
  String key;
  @HiveField(9)
  String about;

  UsersModel(
      {required this.login,
      required this.name,
      required this.password,
      required this.avatar,
      required this.courses,
      required this.sex,
      required this.isReg,
      required this.telephoneNumber,
      required this.key,
      required this.about});
}

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
  List<CoursesModel> courses;
  @HiveField(5)
  bool sex;
  @HiveField(6)
  bool isReg = false;
  @HiveField(7)
  int telephoneNumber;
  @HiveField(8)
  String? key;
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
      this.key,
      required this.about});
}
@HiveType(typeId: 1)
class CoursesModel {
  @HiveField(0)
  String? nameCourse;
  @HiveField(1)
  String? tutor;
  @HiveField(2)
  int? balance;
  @HiveField(3)
  int? costOfCourse;

  CoursesModel({
    required this.nameCourse,
    required this.tutor,
    required this.balance,
    required this.costOfCourse,
  });

  CoursesModel.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    costOfCourse = json['costOfCourse'];
    nameCourse = json['nameOfCourse'];
    tutor = json['tutor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balance'] = balance;
    data['costOfCourse'] = costOfCourse;
    data['nameOfCourse'] = nameCourse;
    data['tutor'] = tutor;
    return data;
  }
}


ListJson(dynamic json){
  return List<CoursesModel>.from(json.map((e)=>CoursesModel.fromJson(e)));
}
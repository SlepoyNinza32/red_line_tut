class UsersModel {
  String login, name, password, avatar;
  List<String> courses;
  bool sex;
  int telephoneNumber;

  UsersModel(
      {required this.login,
      required this.name,
      required this.password,
      required this.avatar,
      required this.courses,
      required this.sex,
      required this.telephoneNumber});
}

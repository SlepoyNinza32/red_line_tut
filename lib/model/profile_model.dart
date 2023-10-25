import 'package:hive/hive.dart';
part 'profile_model.g.dart';

@HiveType(typeId: 0)
class ProfileModel{
  @HiveField(0)
  bool have = false;
  @HiveField(1)
  String login;
  @HiveField(2)
  String password;

  ProfileModel(this.have, this.login, this.password);
}
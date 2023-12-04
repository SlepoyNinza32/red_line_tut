class ListIdModel {
  // List<String>? ids;
  List<CheckList> checkList;
  List<dynamic> students;
  String? name, teacher, keyO;

  ListIdModel({
    // required this.ids,
    required this.students,
    required this.name,
    required this.checkList,
    required this.teacher,
    required this.keyO
  });

// ListIdModel.fromJson(Map<String, dynamic> json) {
//   // ids = json['ids'];
//   students = json['students'];
//   was = json['was'];
//   name = json['name'];
//   teacher = json['teacher'];
// }
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   // data['ids'] = ids;
//   data['students'] = students;
//   data['was'] = was;
//   data['name'] = name;
//   data['teacher'] = teacher;
//   return data;
// }
}

class CheckList {
  String? name;
  bool? was;
  String? day;


  @override
  String toString() {
    return 'CheckList{name: $name, was: $was, day: $day}';
  }

  CheckList({this.name, this.was, this.day});

  CheckList.fromJson(Map<String, dynamic> json) {
    // ids = json['ids'];
    name = json['name'];
    was = json['was'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['ids'] = ids;
    data['was'] = was;
    data['day'] = day;
    data['name'] = name;
    return data;
  }
}

ListJsontoIdModel(dynamic json) {
  return List<CheckList>.from(json.map((e) => CheckList.fromJson(e)));
}
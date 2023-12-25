class ListIdModel {
  // List<String>? ids;
  List<CheckList> checkList;
  List<dynamic> students;
  String? name, teacher, keyO;

  ListIdModel(
      {
      // required this.ids,
      required this.students,
      required this.name,
      required this.checkList,
      required this.teacher,
      required this.keyO});

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
  List<StudentsList>? list;
  String? day;

  @override
  String toString() {
    return 'CheckList{students which was:$day and $list}';
  }

  CheckList({this.list, this.day});

  CheckList.fromJson(Map<String, dynamic> json) {
    // ids = json['ids'];

    day = json['day'];
    list = List<StudentsList>.from(
        json['students'].map((e) => StudentsList.fromJson(e)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['ids'] = ids;
    data['students'] = list?.map((e) => e.toJson()).toList();
    data['day'] = day;
    return data;
  }
}

class StudentsList {
  String? name;
  bool? attended = false;

  StudentsList.fromJson(Map<String, dynamic> json) {
    // ids = json['ids'];

    attended = json['attended'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['ids'] = ids;
    data['name'] = name;
    data['was'] = attended;
    return data;
  }

  @override
  String toString() {
    return 'StudentsList{name: $name, was: $attended}';
  }

  StudentsList({required this.name, required this.attended});
}

ListJsontoIdModel(dynamic json) {

  return List<CheckList>.from(json.map((e) => CheckList.fromJson(e)));
}

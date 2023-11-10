import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../model/users_model.dart';

class Edit_profile extends StatefulWidget {
  final int index;

  const Edit_profile({super.key, required this.index});

  @override
  State<Edit_profile> createState() => _Edit_profileState();
}

class _Edit_profileState extends State<Edit_profile> {
  TextEditingController txtcontr = TextEditingController();
  late Box<UsersModel> box;
  @override
  void initState() {
    super.initState();
    box = Hive.box('profile');
    if(widget.index == 0){
      txtcontr.text = box.get('profileKey')!.name;
    }else{
      txtcontr.text = box.get('profileKey')!.about;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6969),
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.index == 0 ? "Edit nickname" : "Bio"),
        actions: [
          IconButton(onPressed: (){
            if(widget.index == 0 && txtcontr.text.length <= 20){

            }if(widget.index == 0 && txtcontr.text.length > 20){
              print("error");
            }if(widget.index == 1 && txtcontr.text.length <= 200){

            }if(widget.index == 1 && txtcontr.text.length > 200){
              print("error");
            }
          }, icon: Icon(CupertinoIcons.check_mark))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: txtcontr,
              autofocus: true,
              decoration: InputDecoration(),
            ),
          ),
          Text(
            widget.index == 0
                ? "Your nickname can contain maximum 20 symbols"
                : "Your nickname can contain maximum 200 symbols",
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyeinceapp/theme/kdefault.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  _CourseDetailState createState() => _CourseDetailState();
}
class _CourseDetailState extends State<CourseDetail> {
  @override
  Widget build(BuildContext context) {
    return buildList();
}
Widget buildList(){
    return Scaffold(
        appBar: buildAppBar("Course"),
  body: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context,int index){
          return Card(
            child: ListTile(
                 leading: CircleAvatar(
                   backgroundColor: Colors.deepPurple,
                   radius: 12,
                   child: Icon(CupertinoIcons.camera,size: 12,),
                 ),
                 title:Text("Vedio $index",style: TextStyle(fontFamily: "Montserrat"),)
            ),);
  }
  ),
    );
}
}

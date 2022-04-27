import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keyeinceapp/theme/inputTask.dart';
import 'package:keyeinceapp/theme/kdefault.dart';
class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}
  class _TaskState extends State<Task>{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: buildAppBar("Add Task"),
  body: Container(
  child: Column(
  children: [
  inputTask(titleField: "Title", hintField: "Enter your title"),
  inputTask(titleField: "Note", hintField: "Enter note here"),
  inputTask(titleField: "Date", hintField:"Enter date here",
  widget: IconButton(
  icon: Icon(Icons.ten_k,color: Colors.grey,),
  onPressed:()=> print("hello world"),
  ),
  ),
  ],
  ),
  ),
  );
  }
  }

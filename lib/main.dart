import 'package:flutter/material.dart';
import 'package:keyeinceapp/Pages/Course.dart';
import 'package:keyeinceapp/Pages/CourseDetail.dart';
import 'package:keyeinceapp/Pages/Player.dart';
import 'package:keyeinceapp/Pages/Schedule.dart';
import 'package:keyeinceapp/Pages/notes_page.dart';
import 'package:keyeinceapp/theme/inputTask.dart';

import 'Pages/Task.dart';

void main() {
  runApp( const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NotesPage(),
    );
  }
}

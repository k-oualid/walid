import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyeinceapp/Pages/CourseDetail.dart';
import 'package:keyeinceapp/theme/kdefault.dart';

class  CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: buildAppBar("Courses"),
    body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children : [
        ImageCourse('assets/images/javacourse.jpg'),
          const SizedBox(height: 10),
          infoCourse('dr.Nazim Ahmed','4.5','This course will explain about bascics of java and oop , and make some quizz to improve your skills on java','20 vedio','Total 60 lessons','20 Quizz'),
          const SizedBox(height: 35,),
          courseStart(),
          const SizedBox(height: 5,),
      ],
    ),
    ),
    );
}
  Widget infoCourse(String former , String rating , String description,  String numVedio , String numLesson ,String numQuizz){
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20,0,0,0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(former,style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 9,fontFamily: "Montserrat"),),
              const SizedBox(width: 190),
              Text(rating,style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 9,fontFamily: "Montserrat")),
              const SizedBox(width: 4),
              const Icon(Icons.arrow_back_ios,size: 10,),
            ],
          ),
          const SizedBox(height: 40),
          const Text("Description",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "Montserrat"),),
          const SizedBox(height: 10),
          Text(description,style : TextStyle(fontFamily: "Montserrat")),
          const SizedBox(height: 25),
          const Text("The course includes",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "Montserrat"),),
          const SizedBox(height: 15),
          courseInclude(CupertinoIcons.camera, numVedio),
          const SizedBox(height: 5),
          courseInclude(CupertinoIcons.camera, numLesson),
          const SizedBox(height: 5),
          courseInclude(CupertinoIcons.camera, numQuizz),
        ],
      ),

    );
  }
  Widget courseInclude(IconData icon ,String content){
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.deepPurple,
          radius: 12,
          child: Icon(CupertinoIcons.camera,size: 12,),
        ),
        const SizedBox(width: 5,),
        Text(content,style: const TextStyle(fontSize: 12,fontFamily: "Montserrat")),
      ],
    );
  }
  Widget courseStart(){
    return Container(
        decoration:
        BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
        BoxShadow(
        color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(0, 3), // changes position of shadow
    ),
    ],
    ),
        height: 45.0,
        width: double.infinity,
        child: FloatingActionButton.extended(
            elevation: 0.0,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseDetail()));
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            label:  const Text(
              'Start',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat"
              ),
            ),
            backgroundColor: const Color.fromRGBO(42, 88, 244, 1),
        ),
    );
  }
}
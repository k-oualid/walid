import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:keyeinceapp/theme/button.dart';
import 'package:keyeinceapp/theme/kdefault.dart';

import '../theme/kdefault.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Schedule"),
      body: Column(
        children: [
          _addTask(),
          _dateList(),
            ],
          )
    );
  }
  _addTask(){
    return Container(
      margin: const EdgeInsets.only(left: 15,right: 20,top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("22 March 2022",style: TextStyle(fontFamily: "Montserrat",fontSize: 21),),
                  Text("Today",style:TextStyle(fontFamily: "Montserrat",fontSize: 14,)),
                ],
              )
          ),
          const Button(label: "Add Task", onTap:null),
        ],
      ),
    );
  }
  _dateList(){return Container(
    margin: const EdgeInsets.only(left:20,right:20,top: 20),
    child: DatePicker(
      DateTime.now(),
      height: 100,
      width: 80,
      initialSelectedDate: DateTime.now(),
      selectionColor:Colors.blueAccent,
      selectedTextColor: Colors.white,
      dateTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),



    ),
  );}
}

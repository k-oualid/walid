import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Courses.dart';
class DataFromApi extends StatefulWidget {
  const DataFromApi({Key? key}) : super(key: key);

  @override
  _DataFromApiState createState() => _DataFromApiState();
}

class _DataFromApiState extends State<DataFromApi> {
  var title = "pythom";
  Future getRecommendedCourses() async {
    var response = await http.get(Uri.https('https://fastapicrs.herokuapp.com/recommand/',title));
    var jsonData = jsonDecode(response.body);
    List<Courses> courses = [];
    for(var u in jsonData){
      Courses course = Courses(Title: u['Title'], Summary: u['Summary'], Stars: u['Stars'], Link: u['Link']);
      courses.add(course);
    }
    print(courses.length);
    return courses;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Recommended courses'),
      ),
      body: Container(
        child: Card(
          child: FutureBuilder(
            future: getRecommendedCourses(),
              builder: (BuildContext context,AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: const Center(
                    child:Text("Loading ..."),
                  ),
                );
                } else return  ListView.builder(
                 itemCount: 10,
                 itemBuilder: ( context, i) {
                   return ListTile(
                     title:  Text(snapshot.data[i].Title),
                     subtitle: Text(snapshot.data[i].Summary) ,
                     trailing: Text(snapshot.data[i].Stars) ,
                   );
                 },
    );
              }
          ),
        ),
      ),
    );
  }
}

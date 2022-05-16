
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:keyeinceapp/presentation/resources/ColorManager.dart';
import 'package:keyeinceapp/presentation/resources/appStrings.dart';
import '../../../theme/components.dart';
import '../../main/main_view.dart';
import '../../resources/FontsManager.dart';
import '../../resources/values_manager.dart';

class RECOMMANDED_COURSES extends StatefulWidget {
  const RECOMMANDED_COURSES();

  @override
  _RECOMMANDED_COURSESState createState() => _RECOMMANDED_COURSESState();
}

class _RECOMMANDED_COURSESState extends State<RECOMMANDED_COURSES> {
  
  @override
  Widget build(BuildContext context) {
    double widh = MediaQuery.of(context).size.width;
    return Padding(
        padding: const  EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10,top: 20,bottom: 20),
                      child: Text(
                          AppStrings.recommanded_courses ,
                        style:  TextStyle(height: 1.5,color: Colors.black ,fontSize: 24,fontFamily: FontFamilyManager.defaultFamily,fontWeight: FontWeightManager.semiBold),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=> Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  const HomePage() ),
                    ),
                  child:Container(
                  width: 90,
                  height: 46,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: ColorManager.lightDefaultColor,
                  ),
                  child:Center(
                  child: Text(AppStrings.skip,
                  style: TextStyle(
                  color: Colors.white,
                  ),
                  ),
                  )
                  ),
                  ),
                ],
              ),

            CorsesListView(coursess: populaCorses,ontap: (){},),
          ],
        ),

      );

  }
}
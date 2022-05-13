import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:keyeinceapp/presentation/main/Courses/view/CoursesScreen.dart';
import 'package:keyeinceapp/presentation/main/main_Viewmodel.dart';
import 'package:keyeinceapp/presentation/main/postsPages/view/Posts_view.dart';
import 'package:keyeinceapp/presentation/main/sheduleScreen/view/scheduleScreen.dart';
import 'package:keyeinceapp/presentation/resources/values_manager.dart';
import 'package:animations/animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyeinceapp/presentation/resources/App.dart';
import 'package:keyeinceapp/presentation/resources/ColorManager.dart';
import 'package:keyeinceapp/presentation/resources/images.dart';
import 'package:keyeinceapp/services/addPostTOfirebase.dart';
import 'package:provider/provider.dart';

import '../../../../models/Models.dart';
import '../../models/Models.dart';
import '../resources/images.dart';
import 'drawerScreen/view/MenuScreen.dart';
import 'homeScreen/view/MainScreen.dart';


/// this page is not visible ( invisible Wisget ) , this is the widget that containe both MainPage
/// ( you can consider it like HOMEPAGE , a,d the MENUPAGe ( the page of the drawer))

class HomePage extends StatelessWidget {
   const HomePage();

  @override
  Widget build(BuildContext context) {
  //  final ZoomDrawerController _drawerController=ZoomDrawerController();
    // final Size mqs = MediaQuery.of(context).size;
    final double width = MediaQuery.of(context).size.width;

    return ZoomDrawer(
      controller: ZoomDrawerController(),
      //style: DrawerStyle.Style1,
      menuScreen: const drawerScreen(),
      mainScreen: const homePage(),
      borderRadius: AppRadius.r24,
      angle: 0.0,
      showShadow: true,
      mainScreenTapClose: true,
      //backgroundColor: Colors.grey[300]!,
      slideWidth: width * 0.65,
      openCurve: Curves.easeInQuint,
      closeCurve: Curves.easeInQuint,
    );
  }
}


class homePage extends StatelessWidget {
  const homePage();


  @override
  Widget build(BuildContext context) {
      const List<bottomNavyItem> _bottomNavyItems = [
      bottomNavyItem(title: "Home", icon_asset: AppIcons.home,page: homeScreen()),
      bottomNavyItem(title: "SCHEDULE", icon_asset: AppIcons.schedule,page: scheduleScreen()),
      bottomNavyItem(title: "POSTS", icon_asset: AppIcons.post,page: PostsScreen()),
      bottomNavyItem(title: "COURSES", icon_asset: AppIcons.courses,page: coursesScreen()),
//  bottomNavyItem(title: "STATISTICS", icon_asset: "icon"),
    ];
      int _index=Provider.of<buttomNavy_viewModel>(context).index;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
           onPressed: () => ZoomDrawer.of(context)!.toggle(),
          // onPressed: ()async{
          //   for(int i=0;i<5;i++){
          //     await addPostTOfirebase.uploadPost("$i$i$i$i$i$i$i$i$i$i","What is Lorem Ipsum?"
          //         " Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum", []);
          //   }
          // },
          icon: Image.asset(AppIcons.settings,
            color: ColorManager.defaultColor,),
        ),
        title: const Text(app.appName),
        flexibleSpace: Image.asset(images.appBarImage,fit: BoxFit.cover,),
      ),
      body: PageTransitionSwitcher(
        duration: const Duration(seconds: 1),
        transitionBuilder: (child,primaryAnimation,secondaryAnimation)=>SharedAxisTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        ),
        child: _bottomNavyItems[_index].page,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavyItems.map((item) => BottomNavigationBarItem(
          icon: SvgPicture.asset(
            item.icon_asset,
            color: _index==_bottomNavyItems.indexOf(item)? ColorManager.defaultColor : ColorManager.grey,
          ),
          label: item.title,
        ),
        ).toList(),
        currentIndex: _index,
        onTap: (index)=>Provider.of<buttomNavy_viewModel>(context,listen: false).goTo(index),
      ),
    );
  }
}

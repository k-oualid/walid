import 'package:flutter/material.dart';
import 'package:keyeinceapp/presentation/resources/ColorManager.dart';
import 'package:keyeinceapp/presentation/resources/appStrings.dart';
import 'package:keyeinceapp/presentation/resources/values_manager.dart';
import 'package:provider/provider.dart';
import '../../../models/Models.dart';
import '../../resources/FontsManager.dart';
import '../ViewModel/OnBoarding_ViewModel.dart';

class PreferredCourses extends StatelessWidget {
  const PreferredCourses();

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        physics:  const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(
                right: AppPadding.p8,
                bottom: AppPadding.p5
                ,top: AppPadding.p20),
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: RichText(
                text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: AppStrings.onBoardingTitle1,
                        style:  TextStyle(height: 1.5,color: Colors.black ,fontSize: 24,fontFamily: FontFamilyManager.defaultFamily,fontWeight: FontWeightManager.semiBold),
                      ),
                      TextSpan(
                        text: AppStrings.onBoardingTitle2,
                        style:  TextStyle(height: 1.5,color: Colors.black ,fontSize: 24,fontFamily: FontFamilyManager.defaultFamily,fontWeight: FontWeightManager.semiBold),
                      ),
                    ]
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              AppStrings.onBoardingSubTitle,
              style: Theme.of(context).textTheme.caption,
              // style: TextStyle(
            ),
          ),
          const SizedBox(height: 25,),
          GridList(
            ontap: () {},
            list: categries,
          ),
        ],
      );
  }
}

class GridList extends StatefulWidget {
  final Function() ontap;
  final List<categories> list;

  const GridList({required this.list, required this.ontap}) : super();

  @override
  State<GridList> createState() => _GridListState();

}

class _GridListState extends State<GridList> {
   int select = 0;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        semanticChildCount: 2,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 170, crossAxisSpacing: 20, mainAxisSpacing: 20),
        itemCount: widget.list.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: ()=>Provider.of<selectedItemProvier>(context,listen: false).onItemSelected(widget.list[index].title),
          child: Selector<selectedItemProvier,bool>(
            selector: (context,provider)=>provider.selectedItems.contains(widget.list[index].title),
           shouldRebuild: (prev,next)=> prev!=next,
           builder: (context,selected,_)=> AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected? ColorManager.selectColor : ColorManager.defaultColor,
                  borderRadius: BorderRadius.circular(AppRadius.r30),
                ),
                child: Text(
                  widget.list[index].title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ),
          )

        ),
    );
  }
}

List<categories> categries = [
  categories(title: 'DESIGN UI UX'),
  categories(title: 'WEB DEVLOPMENT'),
  categories(title: 'CYBER SECURETY'),
  categories(title: 'MOBILE DEVLOPMENT'),
  categories(title: 'GRAPHICMOYION'),
  categories(title: 'MACHINE LEARNING'),
];


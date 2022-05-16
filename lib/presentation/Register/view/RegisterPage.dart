import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keyeinceapp/commun/Validator.dart';
import 'package:keyeinceapp/presentation/main/main_Viewmodel.dart';
import 'package:keyeinceapp/presentation/Login/View/login.dart';
import 'package:keyeinceapp/presentation/Register/viewModel/RegisterViewModel.dart';
import 'package:keyeinceapp/presentation/resources/App.dart';
import 'package:keyeinceapp/presentation/resources/appStrings.dart';
import 'package:provider/provider.dart';

import '../../resources/ColorManager.dart';
import '../../resources/FontsManager.dart';
import '../../resources/values_manager.dart';




class RegisterPage extends StatelessWidget {
  final PageController pageController;
  const RegisterPage(this.pageController);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return WillPopScope(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<RegisterUser_viewModel>(create: (_) => RegisterUser_viewModel()),
          ],
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: BackButton(
                  color: Colors.black
              ),
              titleSpacing: 0.0,
              title:  Text("TreeTech",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat"),
              ),
              centerTitle: true,
              flexibleSpace: Stack(
                children:<Widget> [
                  Container( decoration:  const BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/backroundappbar.png") , fit: BoxFit.cover)
                  ),
                  ),
                ],
              ),
            ),
            body: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: AppPadding.p20,
                              right: width * 0.28,
                              bottom: AppPadding.p10,
                              left: AppPadding.p10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: const TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: AppStrings.registertitle1,
                                          style:  TextStyle(height: 1.5,color: Colors.black ,fontSize: 24,fontFamily: FontFamilyManager.defaultFamily,fontWeight: FontWeightManager.semiBold),
                                      ),
                                    ]
                                ),
                              ),
                              const  SizedBox(height: AppHeight.h10,),
                              const SizedBox(
                                //height: AppHeight.h50,
                                //width: width * 0.5 ,
                                child:  Text(
                                  "Add your e-mail adresse and password to create your account .",
                                  style:  TextStyle(height: 1.5,fontSize: 13,fontFamily: FontFamilyManager.defaultFamily,fontWeight: FontWeightManager.light),
                                ),
                              ),
                              const  SizedBox(height: AppHeight.h10,),
                            ],
                          ),
                        ),
                      ),
                      /// textFormFields + register Button
                      const SizedBox(height: 15,),
                      const TextFormFields(),
                    ],
                  ),
                ),
                SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: double.infinity,
                          height: height * 0.08,
                          decoration:  const  BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: ColorManager.grey,
                                  offset: Offset(AppOffset.off0_0, AppOffset.off1_0),
                                  blurRadius: AppRadius.r6,
                                ),
                              ],
                              color: ColorManager.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(AppRadius.r30) ,
                                topRight: Radius.circular(AppRadius.r30),
                              )
                          ),
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: AppMargin.m20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: (){
                                  pageController.previousPage(duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
                                },
                                // ),
                                child:  Text(AppStrings.haveAccount,
                                  style: Theme.of(context).textTheme.headline2,),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                )
              ],
            ),
          ),
        ),
        onWillPop: ()async{
          pageController.previousPage(duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
          return false;
        }
        );

  }
}


class TextFormFields extends StatefulWidget {
  const TextFormFields({Key? key}) : super(key: key);

  @override
  State<TextFormFields> createState() => _TextFormFieldsState();
}

class _TextFormFieldsState extends State<TextFormFields> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 late TextEditingController nameTextEdetingController;
 late TextEditingController emailTextEdetingController;
 late TextEditingController passwordTextEdetingController;
 late TextEditingController confirmPasswordTextEdetingController;
 bool inVisible=true;
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
     nameTextEdetingController = TextEditingController();
     emailTextEdetingController = TextEditingController();
     passwordTextEdetingController = TextEditingController();
     confirmPasswordTextEdetingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameTextEdetingController.dispose();
    emailTextEdetingController.dispose();
    passwordTextEdetingController.dispose();
    confirmPasswordTextEdetingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const  EdgeInsets.symmetric(horizontal: AppPadding.p18) ,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// name
            Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p18),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: nameTextEdetingController,
                cursorColor: ColorManager.defaultColor,
                 decoration: const InputDecoration(
                  hintText: " Full name"
                ),
                validator: (value)=>validator.nameValidator(value?? ""),
              ),
            ),
            /// Email
            Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p18),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: emailTextEdetingController,
                cursorColor: ColorManager.defaultColor,
                decoration: const InputDecoration(
                  hintText: ' E-mail',
                ),
                validator: (value)=>validator.emailValidator(value?? ""),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            StatefulBuilder(
              builder: (_,setstate){
                return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ///Password
                      Padding(
                        padding: const EdgeInsets.only(bottom: AppPadding.p18),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          controller: passwordTextEdetingController,
                          cursorColor: ColorManager.defaultColor,
                          decoration:  InputDecoration(
                            hintText: ' Password',
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setstate(()=>inVisible=!inVisible);
                                },
                                child: Icon(inVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                          ),
                          validator: (value)=>validator.passwordlValidator(value?? ""),
                          obscureText: inVisible,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                      ///Confirm Password
                      Padding(
                        padding: const EdgeInsets.only(bottom: AppPadding.p15),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          controller: confirmPasswordTextEdetingController,
                          cursorColor: ColorManager.defaultColor,
                          decoration:  InputDecoration(
                            hintText: ' Confirm Password',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                  setstate(()=>inVisible=!inVisible);
                                },
                                child : Icon(inVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),

                          ),
                          validator: (value)=>validator.confirm_pass_Validator(value?? "" , passwordTextEdetingController.text.trim()),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: inVisible,
                        ),
                      ),
                    ]
                );
              },
            ),
            /// privacy text
            Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                    value: true,
                    onChanged: (value){}
                ),
                const Text(
                  AppStrings.privacy1,
                  style:  TextStyle(fontSize: 12,fontFamily: FontFamilyManager.defaultFamily,fontWeight: FontWeightManager.regular),
                ),
                TextButton(
                  onPressed: (){
                  },
                  child: const AutoSizeText(
                    AppStrings.privacy2,
                    style: TextStyle(color:ColorManager.blue,fontSize: 12,fontFamily: FontFamilyManager.defaultFamily,fontWeight: FontWeightManager.regular),
                  ),
                ),
              ],
            ),
            const  SizedBox(height: AppHeight.h20,),
            SizedBox(
              width: width,
              child: Selector<RegisterUser_viewModel, bool>(
                selector: (context, provider) => provider.isLoading,
                builder: (_,isLoading,child) {
                 return isLoading ? const Center(
                    child: CircularProgressIndicator(),
                  ) :
                  ElevatedButton(
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        FocusScope.of(context).unfocus();
                        Provider.of<nextPage_viewModel>(context,listen: false).register();
                        Provider.of<RegisterUser_viewModel>(context,listen: false).registerUser(
                            email: emailTextEdetingController.text.trim(),
                            password: passwordTextEdetingController.text.trim(),
                            username: nameTextEdetingController.text.trim(),
                            context : context);

                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 2),
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white,fontSize: 15 ,fontFamily: FontFamilyManager.defaultFamily,fontWeight: FontWeightManager.semiBold),
                      ),
                    ),
                  );
                }
              )
            ),
          ],
        ),
      ),
    );
  }
}



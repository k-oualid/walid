import 'package:flutter/material.dart';
import 'package:keyeinceapp/presentation/Register/view/RegisterPage.dart';
import 'package:keyeinceapp/presentation/resources/App.dart';
import 'package:keyeinceapp/presentation/resources/ColorManager.dart';
import 'package:keyeinceapp/presentation/resources/ThemeManager.dart';
import 'package:keyeinceapp/presentation/resources/images.dart';
import 'package:keyeinceapp/commun/Validator.dart';
import 'package:provider/provider.dart';
import '../../resources/FontsManager.dart';
import '../../resources/Styles_Manager.dart';
import '../../resources/appStrings.dart';
import '../../resources/values_manager.dart';
import '../ViewModel/login_viewModel.dart';
import 'package:iconsax/iconsax.dart';
class Login extends StatefulWidget {
  final PageController pageController;
  const  Login(this.pageController);

  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widh = MediaQuery.of(context).size.width;
    return
        MultiProvider(
          providers: [
            ChangeNotifierProvider<loginUser_viewModel>(create:(_)=> loginUser_viewModel())
          ],
          child: SingleChildScrollView(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                padding:  const EdgeInsets.only(left:15,right:15),
                height: height,
                width: double.infinity,
                child: Column(
                  children: [
                   const  SizedBox(height: 150,),
                    Column(
                     children: [
                      Text("Login",style: TextStyle(color: Colors.black ,fontSize: 30,fontFamily: FontFamilyManager.defaultFamily,fontWeight: FontWeightManager.bold)),
                      const SizedBox(height: 8,),
                      Text(
                        AppStrings.logintitle1,
                        style:  TextStyle(height: 1.5,color: Colors.grey[700] ,fontSize: 13,fontFamily: FontFamilyManager.defaultFamily,fontWeight: FontWeightManager.light),
                      ),
                    ],
                    ),
                    const  SizedBox(height: 100,),
                    Container(
                      child:TextFormFields(widget.pageController),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
   // );
  }
}
class TextFormFields extends StatefulWidget {
  final PageController pageController;
  const TextFormFields(this.pageController);

  @override
  _TextFormFieldsState createState() => _TextFormFieldsState();
}
class _TextFormFieldsState extends State<TextFormFields> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController emailTextEdetingController;
  late TextEditingController passwordTextEdetingController;


  @override
  void initState() {
    emailTextEdetingController = TextEditingController();
    passwordTextEdetingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailTextEdetingController.dispose();
    passwordTextEdetingController.dispose();
    super.dispose();
  }
  bool inVisible=true;
  @override
  Widget build(BuildContext context) {
    final double widh = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// E-mail
            Container(
              child: TextFormField(
                style: const TextStyle(color: ColorManager.black),
                controller: emailTextEdetingController,
                cursorColor: ColorManager.defaultColor,
                keyboardType: TextInputType.emailAddress,
                decoration:  InputDecoration(
                  fillColor: ColorManager.inputColor,
                  filled: true,
                  hintText: " E-mail ID",
                  prefixIcon: Icon(Iconsax.sms,color: Colors.grey[400],),
                ),
                validator: (value)=>validator.emailValidator(value?? ""),
              ),
            ),
            SizedBox(height:30),
            /// Password
            StatefulBuilder(
              builder: (_,setstate){
                return  Container(
                  child: TextFormField(
                    style:  TextStyle(color: ColorManager.black),
                    controller: passwordTextEdetingController,
                    cursorColor: ColorManager.defaultColor,
                    decoration:  InputDecoration(
                      fillColor: ColorManager.inputColor,
                      filled: true,
                      hintText: ' Password',
                      prefixIcon: Icon(Iconsax.password_check,color: Colors.grey[400],),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setstate(()=>inVisible=!inVisible);
                          },
                          icon: Icon(inVisible
                              ? Icons.visibility_off
                              : Icons.visibility,color: Colors.grey[400],)),
                    ),
                    validator: (value)=>validator.passwordlValidator(value?? ""),
                    obscureText: inVisible,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                );
              },
            ),
            /// reset Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:240),
                  child: TextButton(
                    onPressed: (){},
                    child:  Text("Forget Password?",
                      style: TextStyle(color: Colors.blue,fontSize: 11 ,fontFamily: FontFamilyManager.defaultFamily,fontWeight: FontWeightManager.semiBold),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            /// log in button
            SizedBox(
                width: widh,
                child: Selector<loginUser_viewModel , bool>(
                  selector: (_,provider)=>provider.isLoading,
                  builder: (_,isLoading,__)=> isLoading? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ) :
                  ElevatedButton(
                    onPressed: ()async{
                      if( _formKey.currentState!.validate()){
                        await Provider.of<loginUser_viewModel>(context,listen: false).loginUser(
                            email: emailTextEdetingController.text.trim(),
                            password: passwordTextEdetingController.text.trim(),
                            context: context);
                      }
                    },
                    child: Center(
                      child: Text('Login',style:TextStyle(color: Colors.white,fontSize: 13)),
                    ),
                  ),
                )
            ),
            SizedBox(height: 15,),
            OrDivider(),
            SizedBox(height: 15,),
            SizedBox(
              width: widh,
              child: ElevatedButton(
                child: Text('Login with Google',style:TextStyle(color: Colors.white,fontSize: 13)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {
                  print('hello ya chayyeb');
                },
              ),
            ),
            const SizedBox(height: 20,),
            /// login via google
            /// register now
              ],
        ),
    );
  }
}
class OrDivider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height*0.02),
      width : size.width * 0.8,
      child: Row(
        children: <Widget>[
          Expanded(
              child: Divider(
            color: Colors.grey,
            height: 1.5,
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("OR",style:TextStyle(fontSize: 12,fontFamily: FontFamilyManager.defaultFamily,fontWeight: FontWeightManager.regular)),
          ),
          Expanded(
              child: Divider(
                color: Colors.grey,
                height: 1.5,
              )),
        ],
      ),
    );
  }
  
}

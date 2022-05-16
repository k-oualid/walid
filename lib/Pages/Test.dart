import 'package:flutter/material.dart';
import 'package:keyeinceapp/theme/kdefault.dart';
import '../theme/components.dart';

class Login extends StatefulWidget {
  const Login();

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widh = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: height * 0.52,
                width: widh,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 8,
                      blurRadius: 14,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 40,bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormFiledC(
                        icon: const Icon(Icons.email, color: Colors.black),
                        text: 'E-mail',
                      ),
                      TextFormFiledC(
                        icon: const Icon(Icons.password, color: Colors.black),
                        text: 'Password',
                        padding: 15,
                      ),
                      Wrap(
                        children: [
                          Container(
                            margin:const EdgeInsets.only(left: 99),
                            child: const Text(
                              "don't remmember password ?",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontFamily: "Montserrat"),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(' rest here ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    fontFamily: "Montserrat")),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      LoginButton(
                        text: 'Log in',
                        onpressed: () {
                        },
                        backgroundCOlor:Color(0xFF2958F5) ,
                        textColor: Colors.white,
                      ),
                      const SizedBox(height:10),
                      LoginButton(
                        text: 'Continue with google',
                        onpressed: () {

                        },
                        backgroundCOlor:Color(0xFFC62A1D) ,
                        textColor: Colors.white,
                      ),
                      const   SizedBox(
                        height: 20,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const   Text(
                            "don't have account ?",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: "Montserrat"),
                          ),
                          GestureDetector(
                            onTap: () {
                            },
                            child: const   Text(' register now ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    fontFamily: "Montserrat")),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

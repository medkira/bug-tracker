import 'package:flutter/services.dart';
import 'package:frontend/blocks/button.dart';
import 'package:flutter/material.dart';
import 'package:frontend/blocks/text_field.dart';
import 'package:frontend/controllers/token_controller.dart';
import 'package:frontend/ip_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Home/home.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  final TokenController tokenController = Get.put(TokenController());
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailTextController = TextEditingController();

  final passwordTextController = TextEditingController();
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async {
    var logBody = {
      "email": emailTextController.text,
      "password": passwordTextController.text
    };

    var response = await http.post(Uri.parse(login),
        headers: {"Content-type": "application/json"},
        body: jsonEncode(logBody));

    var jsonResponse = jsonDecode(response.body);

    if (jsonResponse['status']) {
      var myToken = jsonResponse['token'];
      prefs.setString('token', myToken);

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        Get.find<TokenController>().setToken(myToken);
        return Home();
      }));
    }
    // else {
    //   print("something went wrong");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
        ),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 39, 36, 49),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 75),
                    SvgPicture.asset(
                      'images/undraw_login1.svg',
                      width: 70,
                      height: 160,
                    ),
                    //welcome back message
                    const SizedBox(height: 50),

                    const SizedBox(
                      width: 290,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sign in",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Please fill the input below here",
                            style: TextStyle(
                              color: Color.fromARGB(255, 89, 88, 89),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    //email textfield
                    MyTextfield(
                      controller: emailTextController,
                      hintText: 'email',
                      obscureText: false,
                      icon: const Icon(Icons.mail),
                    ),
                    const SizedBox(height: 15),
                    //password textfield
                    MyTextfield(
                      controller: passwordTextController,
                      hintText: 'password',
                      obscureText: true,
                      icon: const Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 50),

                    //sign in button
                    MyButton(
                      onTap: () {
                        loginUser();
                      },
                      text: 'LOGIN',
                    ),

                    //go to register page
                    Padding(
                      padding: const EdgeInsets.all(27.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Not a member?",
                            style: TextStyle(
                                color: Color.fromARGB(255, 114, 114, 114)),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: const Text(
                              "Resgister now",
                              style: TextStyle(
                                color: Color(0xff17f1de),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

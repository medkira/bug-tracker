import 'dart:convert';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/blocks/button.dart';
import 'package:flutter/material.dart';
import 'package:frontend/blocks/text_field.dart';
import 'package:frontend/ip_config.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  void registerUser() async {
    if (emailTextController.text.isNotEmpty &&
        passwordTextController.text.isNotEmpty) {
      showDialog(
          context: context,
          builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ));

      if (passwordTextController.text != confirmPasswordTextController.text) {
        Navigator.pop(context);

        showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  title: Text("Password don't match"),
                ));
      }

      var regBody = {
        "email": emailTextController.text,
        "password": passwordTextController.text
      };
      var response = await http.post(Uri.parse(register),
          headers: {"Content-type": "application/json"},
          body: jsonEncode(regBody));

      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status']) {
        widget.onTap;
      } else {}
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(39, 36, 49, 1),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 75),
                //logo
                SvgPicture.asset(
                  'images/undraw_login2.svg',
                  width: 70,
                  height: 160,
                ),
                const SizedBox(height: 35),

                //welcome back message
                const Text(
                  "Create your account",
                  style: TextStyle(
                    color: Color.fromARGB(255, 164, 164, 164),
                    fontSize: 17,
                  ),
                ),

                const SizedBox(height: 10),

                //email textfield
                MyTextfield(
                  controller: emailTextController,
                  hintText: 'email',
                  obscureText: false,
                  icon: const Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                ),

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

                //confirm password textfield
                MyTextfield(
                  controller: confirmPasswordTextController,
                  hintText: 'confirm password',
                  obscureText: true,
                  icon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 12),
                //sign up button
                MyButton(
                  onTap: () {
                    registerUser();
                  },
                  text: 'Sign Up',
                ),

                //go to register page
                Padding(
                  padding: const EdgeInsets.all(27.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                            color: Color.fromARGB(255, 114, 114, 114)),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Login here",
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
    );
  }
}

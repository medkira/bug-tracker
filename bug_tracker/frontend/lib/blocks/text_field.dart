import 'package:flutter/material.dart';

class MyTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Icon icon;

  const MyTextfield({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon,
  }) : super(key: key);

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  bool _isfill = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.0, right: 17, bottom: 15),
      child: TextField(
        obscureText: widget.obscureText,
        controller: widget.controller,
        onTap: () {
          setState(() {
            if (_isfill == false) {
              _isfill = true;
            }
          });
        },
        onTapOutside: (event) {
          setState(() {
            if (widget.controller.text != "") {
              _isfill = true;
            } else if (_isfill == true) {
              _isfill = !_isfill;
            }
          });
        },
        style: const TextStyle(
          fontSize: 20,
          color: Color(0xffFAFAFA),
        ),
        decoration: InputDecoration(
          fillColor: _isfill
              ? const Color(0xff39304c)
              : const Color.fromRGBO(39, 36, 49, 1),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color.fromRGBO(39, 36, 49, 1)),
            borderRadius: BorderRadius.circular(17),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
            borderSide: const BorderSide(color: Color.fromRGBO(39, 36, 49, 1)),
          ),
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 89, 88, 89),
          ),
          prefixIcon: Icon(
            widget.icon.icon,
            color: _isfill
                ? const Color.fromARGB(255, 146, 143, 146)
                : const Color.fromARGB(255, 89, 88, 89),
          ),
        ),
      ),
    );
  }
}

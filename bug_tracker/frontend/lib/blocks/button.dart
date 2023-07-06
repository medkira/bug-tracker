import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        height: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color.fromARGB(213, 34, 225, 209),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            color: Color.fromARGB(255, 39, 36, 49),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        )),
      ),
    );
  }
}
//  Color.fromARGB(22, 0, 70, 135),
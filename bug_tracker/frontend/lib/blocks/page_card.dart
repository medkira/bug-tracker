import 'package:flutter/material.dart';

class PageCard extends StatefulWidget {
  const PageCard({super.key});

  @override
  State<PageCard> createState() => _PageCardState();
}

class _PageCardState extends State<PageCard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        decoration: TextDecoration.none,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 15),
            ),
          ],
          color: const Color.fromARGB(255, 143, 190, 200),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.only(top: 18, right: 18, left: 18),
        width: 350,
        padding: const EdgeInsets.only(
          top: 18,
          left: 15,
        ),
        height: 150,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image.asset('assets/doctor_icon.jpg',
                //     height: 63, width: 70, fit: BoxFit.contain),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("D. Adem Dice",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    SizedBox(height: 6),
                    Text(
                      "Heart Specialist",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.5,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

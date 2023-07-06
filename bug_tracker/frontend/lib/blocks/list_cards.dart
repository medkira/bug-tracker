import 'package:flutter/material.dart';
import 'package:frontend/animation/opencontainer_animation.dart';

class CardsList extends StatelessWidget {
  const CardsList({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> list = ["1", "2", "3", "4", "5"];
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 8.0,
      ),
      child: Row(
        children: list.map((data) {
          return Container(
            margin: const EdgeInsets.only(left: 17),
            child: OpenContainerAnimation(
              color: const Color.fromARGB(255, 72, 201, 221),
              raduisBorder: 18,
              widget: Container(
                padding: const EdgeInsets.all(50),
                child: Text(data),
              ),
              navigateToWidget: Text("hi"),
            ),
          );
        }).toList(),
      ),
    );
  }
}

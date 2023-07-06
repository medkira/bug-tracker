import 'package:flutter/material.dart';
import 'package:frontend/animation/opencontainer_animation.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> list = ["1", "2", "3", "4", "5"];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list.map((data) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: OpenContainerAnimation(
            color: Colors.white,
            raduisBorder: 18,
            widget: SizedBox(
                width: 350,
                height: 100,
                // padding: const EdgeInsets.all(50),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(65, 126, 122, 122),
                      ),
                    )
                  ],
                )),
            navigateToWidget: const Text("hi"),
          ),
        );
      }).toList(),
    );
  }
}

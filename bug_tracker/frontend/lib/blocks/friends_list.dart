import 'package:flutter/material.dart';
import 'package:frontend/animation/opencontainer_animation.dart';
import 'package:get/get.dart';

import '../pages/Chat/chat_room.dart';

class FriendsList extends StatelessWidget {
  const FriendsList({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> list = ["", "", "", "", "", ""];
    return Row(
      children: list.map((data) {
        return Container(
            margin: const EdgeInsets.only(left: 17),
            child: GestureDetector(
              onTap: () {
                Get.to(() => ChatRoom(), transition: Transition.fadeIn);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 72, 201, 221),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: SizedBox(
                  height: 55,
                  width: 55,
                  child: Text(data),
                ),
              ),
            ));
      }).toList(),
    );
  }
}


// OpenContainerAnimation(
//             color: const Color.fromARGB(255, 72, 201, 221),
//             raduisBorder: 50,
//             widget: SizedBox(
//               height: 55,
//               width: 55,
//               child: Text(data),
//             ),
//             navigateToWidget: ChatRoom(),
//           ),











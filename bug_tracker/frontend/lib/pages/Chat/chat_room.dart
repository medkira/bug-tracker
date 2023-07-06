import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_page_controller.dart';

class ChatRoom extends StatelessWidget {
  final chatPageController = Get.put(ChatPageController());

  ChatRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("chat Room"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
              onTap: () {
                Get.find<ChatPageController>()
                    .sendMessage("hi FROM THE CLIENT");
              },
              child: const Text("Message")),
          Container(
            margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
            child: TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 100, 152, 194),
                    width: 2.0,
                  ),
                ),
                contentPadding: const EdgeInsets.all(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

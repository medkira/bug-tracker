import 'package:flutter/material.dart';
import 'package:frontend/auth/login_or_register.dart';
import 'package:frontend/blocks/page_card.dart';
import 'package:frontend/controllers/token_controller.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final TokenController tokenController = Get.put(TokenController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        const PageCard(),
        MaterialButton(
          onPressed: () {
            Get.find<TokenController>().deleteToken();
            Get.offAll(() => const LoginOrRegister());
          },
          child: const Text("logout"),
        )
      ],
    );
  }
}

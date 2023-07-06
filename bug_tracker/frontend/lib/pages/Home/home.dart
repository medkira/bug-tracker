import 'package:flutter/material.dart';
import 'package:frontend/blocks/bottom_navigator_bar.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("")),
      // resizeToAvoidBottomInset: false,
      extendBody: true,
      // appBar: AppBar(title: const Text("Home")),
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return controller.selectedBottomNav.page;
          }),

      bottomNavigationBar: const BarNavigation(),
    );
  }
}

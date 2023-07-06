import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import '../pages/Home/home_controller.dart';
import '../utils/navbar_utils.dart';
import '../utils/rive_utils.dart';

class BarNavigation extends StatelessWidget {
  const BarNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          decoration: BoxDecoration(
            color: const Color.fromARGB(186, 50, 50, 63),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (var icon in bottomnavs)
                  GestureDetector(
                    onTap: () {
                      controller.selectedIcon(icon);

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => icon.page),
                      // );
                    },
                    child: SizedBox(
                      height: 38,
                      width: 38,
                      child: Opacity(
                        opacity: icon == controller.selectedBottomNav ? 1 : 0.5,
                        child: RiveAnimation.asset(
                          icon.src,
                          artboard: icon.artboard,
                          onInit: (artboard) {
                            StateMachineController controller =
                                RiveUtils.getRiveController(artboard,
                                    stateMachineName: icon.stateMachineName);
                            icon.input =
                                controller.findInput<bool>("active") as SMIBool;
                          },
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          )),
    );
  }
}

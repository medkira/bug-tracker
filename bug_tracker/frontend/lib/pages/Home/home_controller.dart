import 'package:get/get.dart';
import '../../utils/navbar_utils.dart';

class HomeController extends GetxController {
  RiveAsset selectedBottomNav = bottomnavs[0];
  // late Widget page;
  void selectedIcon(RiveAsset icon) {
    if (selectedBottomNav != icon) {
      selectedBottomNav = icon;
      icon.input!.change(true);
      Future.delayed(const Duration(seconds: 1), () {
        icon.input!.change(false);
      });

     

      update();
    }
  }
}

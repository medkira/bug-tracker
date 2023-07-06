import 'package:frontend/auth/login_or_register.dart';
import 'package:flutter/material.dart';
import 'package:frontend/controllers/token_controller.dart';
import 'package:frontend/pages/Home/home.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/adapters.dart';

Box? tokenBox;

Future<Box> openHiveBox(String boxname) async {
  if (!Hive.isBoxOpen(boxname)) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }
  return Hive.openBox(boxname);
}

bool isValid() {
  if (Get.find<TokenController>().getToken() != "") {
    return true;
  } else {
    return false;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tokenBox = await openHiveBox("tokenBox");
  Get.put(TokenController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: isValid() ? const Home() : const LoginOrRegister(),
    );
  }
}

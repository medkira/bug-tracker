import 'package:get/get.dart';
import 'package:hive/hive.dart';

class TokenController extends GetxController {
  late String token;
  final Box tokenBox = Hive.box('tokenBox');

  void setToken(String newToken) {
    token = newToken;

    tokenBox.put('token', token);
    print("the token is: $token");

    update();
  }

  String getToken() {
    token = tokenBox.get('token', defaultValue: "") ?? "";
    return token;
  }

  void deleteToken() {
    token = '';
    tokenBox.delete('token');
    update();
  }
}

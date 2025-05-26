import 'package:get/get.dart';

class PasswordFieldController extends GetxController {
  var obscureText = true.obs;

  void toggleObscure() {
    obscureText.value = !obscureText.value;
  }
}

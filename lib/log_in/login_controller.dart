import 'login_model.dart';

class LoginController {
  void togglePasswordVisibility(UserModel user) {
    user.isPasswordVisible = !user.isPasswordVisible;
  }
}

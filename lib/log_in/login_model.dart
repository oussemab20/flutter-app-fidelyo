class LoginModel {
  // Any additional properties or methods for login model can be added here
}

class UserModel {
  String email;
  String password;
  bool isPasswordVisible;

  UserModel({
    required this.email,
    required this.password,
    this.isPasswordVisible = false,
  });
}

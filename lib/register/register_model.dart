class RegisterModel {
  String fullName;
  String email;
  String phoneNumber;
  String address;
  String location;
  String zipCode;
  String password; // Add this line

  RegisterModel({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.location,
    required this.zipCode,
    required this.password, // Add this line
  });
}

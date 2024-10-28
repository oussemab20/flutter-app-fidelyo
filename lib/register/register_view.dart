import 'package:flutter/material.dart';
import '../app_colors.dart';
import 'register_controller.dart';
import 'register_model.dart';

class RegisterView extends StatelessWidget {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final RegisterController _controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(child: Image.asset('assets/LOGO.png')),
              SizedBox(height: 20),

              // Full Name Section
              buildTextField('Full name', _fullNameController, 'Enter your full name', 30, context),
              SizedBox(height: 20),

              // Email Address Section
              buildTextField('Email Address', _emailController, 'Enter your email address', null, context),
              SizedBox(height: 20),

              // Phone Number Section
              buildTextField('Phone Number', _phoneNumberController, 'Enter your phone number', null, context),
              SizedBox(height: 20),

              // Address Section
              buildTextField('Address', _addressController, 'Enter your address', 30, context),
              SizedBox(height: 20),

              // Location and Zip Code Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: buildTextField('Location', _locationController, 'Enter your location', 15, context)),
                  SizedBox(width: 10),
                  Expanded(child: buildTextField('Zip Code', _zipCodeController, 'Enter zip code', 6, context)),
                ],
              ),
              SizedBox(height: 20),

              // Password Section
              buildTextField('Password', _passwordController, 'Enter your password', null, context, isPassword: true),
              SizedBox(height: 10),
              buildTextField('Confirm Password', _confirmPasswordController, 'Confirm your password', null, context, isPassword: true),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  String fullName = _fullNameController.text;
                  String email = _emailController.text;
                  String phoneNumber = _phoneNumberController.text;
                  String address = _addressController.text;
                  String location = _locationController.text;
                  String zipCode = _zipCodeController.text;
                  String password = _passwordController.text;
                  String passwordConfirmation = _confirmPasswordController.text;

                  String? errorMessage;

                  // Validate inputs
                  if (fullName.length > 30) {
                    errorMessage = 'Your name is too long!';
                  } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email)) {
                    errorMessage = 'Put a valid email!';
                  } else if (!RegExp(r'^\d+$').hasMatch(phoneNumber)) {
                    errorMessage = 'Please use numbers!';
                  } else if (address.length > 30) {
                    errorMessage = 'Your address is too long!';
                  } else if (location.length > 15) {
                    errorMessage = 'Your location is too long!';
                  } else if (zipCode.length > 6 || !RegExp(r'^\d+$').hasMatch(zipCode)) {
                    errorMessage = 'Please write numbers!';
                  } else if (password.isEmpty) {
                    errorMessage = 'Password cannot be empty!';
                  } else if (password != passwordConfirmation) {
                    errorMessage = 'Confirm your password!';
                  }

                  // If there's an error message, show it in a dialog or toast
                  if (errorMessage != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(errorMessage, style: TextStyle(color: Colors.red))),
                    );
                    return;
                  }

                  // Create a new RegisterModel instance
                  RegisterModel model = RegisterModel(
                    fullName: fullName,
                    email: email,
                    phoneNumber: phoneNumber,
                    address: address,
                    location: location,
                    zipCode: zipCode,
                    password: password, // Add the password here
                  );

                  // Call the register function from the controller
                  _controller.registerUser(model);
                },
                child: Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, String hint, int? maxLength, BuildContext context, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: AppColors.secondary, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            errorText: maxLength != null && controller.text.length > maxLength ? 'Error message here' : null,
          ),
          maxLength: maxLength,
        ),
      ],
    );
  }
}

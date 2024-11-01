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

  // Declare FocusNodes for each field
  final FocusNode _fullNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _locationFocusNode = FocusNode();
  final FocusNode _zipCodeFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Dismiss keyboard on outside tap
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                Center(child: Image.asset('assets/LOGO.png')),
                SizedBox(height: 20),
                buildTextField('Full name', _fullNameController, 'Enter your full name', 30, context, focusNode: _fullNameFocusNode),
                SizedBox(height: 20),
                buildTextField('Email Address', _emailController, 'Enter your email address', null, context, focusNode: _emailFocusNode),
                SizedBox(height: 20),
                buildTextField('Phone Number', _phoneNumberController, 'Enter your phone number', null, context, focusNode: _phoneNumberFocusNode),
                SizedBox(height: 20),
                buildTextField('Address', _addressController, 'Enter your address', 30, context, focusNode: _addressFocusNode),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: buildTextField('Location', _locationController, 'Enter your location', 15, context, focusNode: _locationFocusNode)),
                    SizedBox(width: 10),
                    Expanded(child: buildTextField('Zip Code', _zipCodeController, 'Enter zip code', 6, context, focusNode: _zipCodeFocusNode)),
                  ],
                ),
                SizedBox(height: 20),
                buildTextField('Password', _passwordController, 'Enter your password', null, context, focusNode: _passwordFocusNode, isPassword: true),
                SizedBox(height: 10),
                buildTextField('Confirm Password', _confirmPasswordController, 'Confirm your password', null, context, focusNode: _confirmPasswordFocusNode, isPassword: true),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    width: 380,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          // Create a RegisterModel instance
                          RegisterModel model = RegisterModel(
                            fullName: _fullNameController.text,
                            email: _emailController.text,
                            phoneNumber: _phoneNumberController.text,
                            address: _addressController.text,
                            location: _locationController.text,
                            zipCode: _zipCodeController.text,
                            password: _passwordController.text,
                          );

                          // Call the register logic
                          await _controller.registerUser(model);

                          // Optionally, show a success message or handle errors
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('User registered successfully!')),
                          );

                          // Clear the fields after registration
                          _fullNameController.clear();
                          _emailController.clear();
                          _phoneNumberController.clear();
                          _addressController.clear();
                          _locationController.clear();
                          _zipCodeController.clear();
                          _passwordController.clear();
                          _confirmPasswordController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, String hint, int? maxLength, BuildContext context, {FocusNode? focusNode, bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: AppColors.secondary, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          focusNode: focusNode,
          obscureText: isPassword,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
          maxLength: maxLength,
          keyboardType: label == 'Phone Number' || label == 'Zip Code' ? TextInputType.number : TextInputType.text,
          buildCounter: (BuildContext context, {required int currentLength, required bool isFocused, int? maxLength}) {
            return null;
          },
        ),
      ],
    );
  }
}

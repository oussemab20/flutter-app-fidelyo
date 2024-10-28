import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app_colors.dart';
import '../register/register_view.dart';
import 'login_controller.dart';
import 'login_model.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final UserModel _user = UserModel(email: '', password: '');
  final LoginController _controller = LoginController();
  bool _isRememberMeChecked = false; // Variable for "Remember Me" checkbox

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

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
              Image.asset('assets/LOGO.png'),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '  Hi, Welcome Back 👋',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '    Hello again, you’ve been missed!',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(fontSize: 18, color: AppColors.secondary, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      focusNode: _emailFocusNode, // Assign the focus node
                      onChanged: (value) {
                        _user.email = value; // Update email in user model
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        hintText: '   Enter your email',
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      ),
                      onTap: () {
                        setState(() {
                          FocusScope.of(context).requestFocus(_emailFocusNode);
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Password',
                      style: TextStyle(fontSize: 18, color: AppColors.secondary, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      focusNode: _passwordFocusNode, // Assign the focus node
                      obscureText: !_user.isPasswordVisible,
                      onChanged: (value) {
                        _user.password = value; // Update password in user model
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        hintText: '   Please Enter Your Password',
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _user.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _controller.togglePasswordVisibility(_user); // Use controller to toggle visibility
                            });
                          },
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          FocusScope.of(context).requestFocus(_passwordFocusNode);
                        });
                      },
                    ),
                    SizedBox(height: 10), // Space between the password field and the checkbox/link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items to the edges
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _isRememberMeChecked,
                              onChanged: (value) {
                                setState(() {
                                  _isRememberMeChecked = value ?? false; // Update checkbox state
                                });
                              },
                            ),
                            Text('Remember Me'),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO: Add functionality for "Forgot Password?"
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Or With',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align buttons evenly
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Add Google login functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // White background
                      side: BorderSide(color: Colors.grey, width: 2), // Grey border
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    ),
                    child: Row(
                      children: [
                        FaIcon(FontAwesomeIcons.google, color: Colors.black),
                        SizedBox(width: 20), // Space between icon and text
                        Text(
                          'Google',
                          style: TextStyle(color: Colors.black), // Black text
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Add Facebook login functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // White background
                      side: BorderSide(color: Colors.grey, width: 2), // Grey border
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    ),
                    child: Row(
                      children: [
                        FaIcon(FontAwesomeIcons.facebook, color: Colors.black),
                        SizedBox(width: 20), // Space between icon and text
                        Text(
                          'Facebook',
                          style: TextStyle(color: Colors.black), // Black text
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New client? '),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterView()),
                      );
                    },
                    child: Text(
                      'Register here',
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: 380,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient, // Apply the gradient here
                      borderRadius: BorderRadius.circular(25), // Match the button's border radius
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Add login functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, // Make the button transparent to show the gradient
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Keep the text color white
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
    );
  }
}

import 'package:flutter/material.dart';

import 'log_in/login_view.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Image.asset(
              'assets/welcome to fideliyo 1.png',

            ),
            SizedBox(height: 60),
            Image.asset(
              'assets/Second_page.png',
              width: 380,
              height: 380,
            ),
            SizedBox(height: 90),
            Text(
              'By logging in or registering you agree to our Terms of Use and Privacy Policy.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.purple,

              ),
            ),
            SizedBox(height: 40), // Add spacing between the text and button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
              child: Text('Get started'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Background color
                foregroundColor: Colors.white, // Text color
                padding: EdgeInsets.symmetric(horizontal: 140, vertical: 15), // Button padding
                textStyle: TextStyle(
                  fontSize: 18, // Font size
                  fontWeight: FontWeight.bold, // Font weight
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

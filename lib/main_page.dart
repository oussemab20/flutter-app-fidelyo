import 'package:flutter/material.dart';
import 'second_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondPage()),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo final fideliyo sans background 3.png',
              ),
              SizedBox(height:30),
              Image.asset(
                'assets/slogon 1.png',

              ),
            ],
          )
        ),
      ),
    );
  }
}

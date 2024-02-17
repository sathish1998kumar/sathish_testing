import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  String username;
  String password;
  String token;
   WelcomeScreen({super.key,required this.username, required this.password, required this.token});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Animated app logo
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              height: 150,
              child: Image.asset('assets/welcome.png'),
            ),
            SizedBox(height: 30),
            Text(
              'Welcome to ${widget.username}',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Hi ${widget.username},How are you',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black45,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: Colors.orange, // Set button background color
                onPrimary: Colors.white, // Set button text color
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



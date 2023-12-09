import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
       const Duration(seconds: 5),
           () => Navigator.pushReplacement(
         context,
         MaterialPageRoute(builder: (context) => MyForm2 ()), // Replace YourNextScreen with the actual screen you want to navigate to.
       ),
     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          "images/animation.json",
          width: 200,
          height: 200,
          repeat: true,
        ),
      ),
    );
  }
}


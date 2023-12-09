import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'login.dart';

class loadingscreen extends StatefulWidget {
  @override
  loadingscreenState createState() => loadingscreenState();
}

class loadingscreenState extends State<loadingscreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 5),
          () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginForm())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("images/Animation - 1701605840506.json", height: 200, width: 200),
      ),
    );
  }
}

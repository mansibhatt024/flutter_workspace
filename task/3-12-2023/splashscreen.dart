import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';


import 'package:lottie/lottie.dart';

import 'login.dart';


void main() {
  runApp(MaterialApp(
    home: MyApp(),
   debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => loginpage()),
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Screen"),
      ),
      body: Center(
        child: Lottie.asset("images/Animation - 1701535855283.json", width: 200, height: 200, repeat: true),
      ),
    );
  }
}







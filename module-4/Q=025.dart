//. Write a code to display Splash Screen using Activity
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';

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
        MaterialPageRoute(builder: (context) => HomeScreen()),
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
        child: Lottie.network("https://lottiefiles.com/animations/material-wave-loading-yt2uoeE83o", width: 200, height: 200, repeat: true),
      ),
    );
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Your main app content goes here
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Welcome to your app!'),
      ),
    );
  }
}







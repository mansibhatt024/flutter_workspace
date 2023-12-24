//5. create an application to change background when button is clicked
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BackgroundChangeApp(),
    );
  }
}

class BackgroundChangeApp extends StatefulWidget {
  @override
  _BackgroundChangeAppState createState() => _BackgroundChangeAppState();
}

class _BackgroundChangeAppState extends State<BackgroundChangeApp> {
  Color _backgroundColor = Colors.blue; // Initial background color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Background Changer'),
      ),
      body: Container(
        color: _backgroundColor, // Set the background color here
        child: Center(
          child: ElevatedButton(
            onPressed: changeBackgroundColor,
            child: Text('Change Background Color'),
          ),
        ),
      ),
    );
  }

  void changeBackgroundColor() {
    // Generate a random color for the background
    Color newColor = Color((DateTime.now().millisecondsSinceEpoch / 10).toInt())
        .withOpacity(1.0);

    setState(() {
      _backgroundColor = newColor;
    });
  }
}

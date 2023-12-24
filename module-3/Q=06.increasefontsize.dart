//6. create an application to increate font size when plus button click and
decrease when minus button click
  import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FontSizeChangeApp(),
    );
  }
}

class FontSizeChangeApp extends StatefulWidget {
  @override
  _FontSizeChangeAppState createState() => _FontSizeChangeAppState();
}

class _FontSizeChangeAppState extends State<FontSizeChangeApp> {
  double _fontSize = 20.0; // Initial font size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Font Size Changer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HELLO WORLD',
              style: TextStyle(fontSize: _fontSize),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: increaseFontSize,
                  child: Text('Increase'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: decreaseFontSize,
                  child: Text('Decrease'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void increaseFontSize() {
    setState(() {
      _fontSize += 2.0; // You can adjust the step size as needed
    });
  }

  void decreaseFontSize() {
    setState(() {
      if (_fontSize > 2.0) {
        _fontSize -= 2.0; // You can adjust the step size as needed
      }
    });
  }
}

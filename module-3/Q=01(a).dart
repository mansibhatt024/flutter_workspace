import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Colored Layout Example'),
        ),
        body: ColoredLayoutScreen(),
      ),
    );
  }
}

class ColoredLayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Red Rectangle
        Container(
          color: Colors.red,
          height: 200,
          width: double.infinity,
          alignment: Alignment.center,
        ),
        SizedBox(height: 10),
        // Grid View with 4 squares
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(color: Colors.blue, height: 100, width: 100),
            Container(color: Colors.blue, height: 100, width: 100),
            Container(color: Colors.blue, height: 100, width: 100),
            Container(color: Colors.blue, height: 100, width: 100),
          ],
        ),
        SizedBox(height: 10),
        // Yellow Squares
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(color: Colors.yellow, height: 100, width: 100),
            Container(color: Colors.yellow, height: 100, width: 100),
            Container(color: Colors.yellow, height: 100, width: 100),
          ],
        ),
      ],
    );
  }
}

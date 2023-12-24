//8. Write a program to show four images around Textview.
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
          title: Text('Images Around TextView'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network('https://ichef.bbci.co.uk/news/999/cpsprodpb/15951/production/_117310488_16.jpg', width: 100, height: 100),
                  SizedBox(width: 20),
                  Image.network('https://assets.entrepreneur.com/content/3x2/2000/20200429211042-GettyImages-1164615296.jpeg?format=pjeg&auto=webp&crop=16:9', width: 100, height: 100),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'hello customer',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQI-SaYWlXmVicHWYEEpRgrmFir507tWQk3pA&usqp=CAU', width: 100, height: 100),
                  SizedBox(width: 20),
                  Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoUEzLKGWhf-Oc2y46H9-0xSXITsgTQklZNQ&usqp=CAU', width: 100, height: 100),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

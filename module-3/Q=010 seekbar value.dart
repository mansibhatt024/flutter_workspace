//10. Write a program you have taken three seek bar controls. From three Seekbar which Seekbar value changed the background color of device will be changed
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
          title: Text('Color Picker App'),
        ),
        body: MyColorPicker(),
      ),
    );
  }
}

class MyColorPicker extends StatefulWidget {
  @override
  _MyColorPickerState createState() => _MyColorPickerState();
}

class _MyColorPickerState extends State<MyColorPicker> {
  double redValue = 0.0;
  double greenValue = 0.0;
  double blueValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            value: redValue,
            onChanged: (value) {
              setState(() {
                redValue = value;
              });
            },
            min: 0,
            max: 255,
            label: 'Red',
            activeColor: Colors.red,
          ),
          Slider(
            value: greenValue,
            onChanged: (value) {
              setState(() {
                greenValue = value;
              });
            },
            min: 0,
            max: 255,
            label: 'Green',
            activeColor: Colors.green,
          ),
          Slider(
            value: blueValue,
            onChanged: (value) {
              setState(() {
                blueValue = value;
              });
            },
            min: 0,
            max: 255,
            label: 'Blue',
            activeColor: Colors.blue,
          ),
          SizedBox(height: 20),
          Container(
            width: 200,
            height: 200,
            color: Color.fromRGBO(
              redValue.round(),
              greenValue.round(),
              blueValue.round(),
              1.0,
            ),
          ),
        ],
      ),
    );
  }
}

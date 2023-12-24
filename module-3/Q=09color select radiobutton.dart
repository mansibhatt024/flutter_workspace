//  Write a program in android display screen color which the Color will be select from the radio button.
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
  Color _selectedColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadioListTile(
            title: Text('Red'),
            value: Colors.red,
            groupValue: _selectedColor,
            onChanged: (Color? value) {
              setState(() {
                _selectedColor = value!;
              });
            },
          ),
          RadioListTile(
            title: Text('Green'),
            value: Colors.green,
            groupValue: _selectedColor,
            onChanged: (Color? value) {
              setState(() {
                _selectedColor = value!;
              });
            },
          ),
          RadioListTile(
            title: Text('Blue'),
            value: Colors.blue,
            groupValue: _selectedColor,
            onChanged: (Color? value) {
              setState(() {
                _selectedColor = value!;
              });
            },
          ),
          SizedBox(height: 20),
          Container(
            width: 200,
            height: 200,
            color: _selectedColor,
          ),
        ],
      ),
    );
  }
}

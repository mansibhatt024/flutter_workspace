//28. Create an Application to take input two numbers from users and
// when user press button then display sum of those values of next
// Activity
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputScreen(),
    );
  }
}

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Number 1'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Number 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next screen and pass the numbers
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      num1: double.parse(num1Controller.text),
                      num2: double.parse(num2Controller.text),
                    ),
                  ),
                );
              },
              child: Text('Calculate Sum'),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final double num1;
  final double num2;

  ResultScreen({required this.num1, required this.num2});

  @override
  Widget build(BuildContext context) {
    double sum = num1 + num2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Result Screen'),
      ),
      body: Center(
        child: Text(
          'Sum: $sum',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}






import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();
  String result = '';
  String operation = 'Add';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Radio(
                  value: 'Add',
                  groupValue: operation,
                  onChanged: (value) {
                    setState(() {
                      operation = value.toString();
                    });
                  },
                ),
                Text('Add'),
                Radio(
                  value: 'Subtract',
                  groupValue: operation,
                  onChanged: (value) {
                    setState(() {
                      operation = value.toString();
                    });
                  },
                ),
                Text('Subtract'),
                Radio(
                  value: 'Multiply',
                  groupValue: operation,
                  onChanged: (value) {
                    setState(() {
                      operation = value.toString();
                    });
                  },
                ),
                Text('Multiply'),
                Radio(
                  value: 'Divide',
                  groupValue: operation,
                  onChanged: (value) {
                    setState(() {
                      operation = value.toString();
                    });
                  },
                ),
                Text('Divide'),
              ],
            ),
            TextField(
              controller: number1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter number 1'),
            ),
            TextField(
              controller: number2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter number 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculate,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text('Result: $result', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }

  void calculate() {
    double num1 = double.tryParse(number1Controller.text) ?? 0.0;
    double num2 = double.tryParse(number2Controller.text) ?? 0.0;

    double _result = 0.0;

    switch (operation) {
      case 'Add':
        _result = num1 + num2;
        break;
      case 'Subtract':
        _result = num1 - num2;
        break;
      case 'Multiply':
        _result = num1 * num2;
        break;
      case 'Divide':
        if (num2 != 0) {
          _result = num1 / num2;
        } else {
          // Handle division by zero
          setState(() {
            result = 'Cannot divide by zero';
          });
          return;
        }
        break;
    }

    setState(() {
      result = _result.toString();
    });
  }
}

// 3. Create an application to input 2 numbers from user and all numbers
// between those 2 numbers in next activity
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputNumbersPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InputNumbersPage extends StatefulWidget {
  @override
  _InputNumbersPageState createState() => _InputNumbersPageState();
}

class _InputNumbersPageState extends State<InputNumbersPage> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Numbers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: firstNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter First Number'),
            ),
            SizedBox(height: 30),
            TextField(
              controller: secondNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Second Number'),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                int firstNumber = int.tryParse(firstNumberController.text) ?? 0;
                int secondNumber = int.tryParse(secondNumberController.text) ?? 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DisplayNumbersPage(
                      firstNumber: firstNumber,
                      secondNumber: secondNumber,
                    ),
                  ),
                );
              },
              child: Text('Show Numbers'),
            ),
          ],
        ),
      ),
    );
  }
}

class DisplayNumbersPage extends StatelessWidget {
  final int firstNumber;
  final int secondNumber;

  DisplayNumbersPage({required this.firstNumber, required this.secondNumber});

  @override
  Widget build(BuildContext context) {
    List<int> numbers = [];
    for (int i = firstNumber+1; i < secondNumber; i++) {
      numbers.add(i);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Numbers Display'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Numbers between $firstNumber and $secondNumber:'),
            SizedBox(height: 16),
            Text(numbers.toString()),
          ],
        ),
      ),
    );
  }
}

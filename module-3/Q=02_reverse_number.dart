// Create an application to take input number from user and print its
// reverse number in TextField

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ReversePrintPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ReversePrintPage extends StatefulWidget {
  const ReversePrintPage({Key? key}) : super(key: key);

  @override
  State<ReversePrintPage> createState() => _ReversePrintPageState();
}

class _ReversePrintPageState extends State<ReversePrintPage> {
  TextEditingController numberController = TextEditingController();
  TextEditingController resultController = TextEditingController();
  int reversedNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reverse Number App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              "Value of Reverse Printing.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 70),
            TextFormField(
              controller: numberController,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black26,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                labelText: "Enter number",
                prefixIcon: const Icon(
                  CupertinoIcons.number_circle_fill,
                  color: Colors.black,
                  size: 30,
                ),
                hintText: "54321",
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: () async {
                  print(numberController.text);
                  int reversedNumber =
                  await reversePrinting(numberController.text);
                  setState(() {
                    resultController.text = reversedNumber.toString();
                  });
                },
                child: const Text("SUBMIT"),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              readOnly: true,
              controller: resultController,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                labelText: "Result of Reverse Printing",
                prefixIcon: const Icon(
                  CupertinoIcons.number_circle_fill,
                  color: Colors.black,
                  size: 25,
                ),
                hintText: "Reversed Value",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<int> reversePrinting(String value) async {
    String numberString = value.toString();
    int i = numberString.length - 1;
    reversedNumber = 0;
    while (i >= 0) {
      int digit = int.parse(numberString[i]);
      reversedNumber = reversedNumber * 10 + digit;
      i--;
    }
    return reversedNumber;
  }
}

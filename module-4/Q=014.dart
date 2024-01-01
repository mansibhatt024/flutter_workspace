//14. Write a code to display simple alert dialog with title, description and
// icon when button is clicked
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showAlertDialog(context);
          },
          child: Text('Show Alert Dialog'),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Column(
            children: [
              Text('This is a simple alert dialog.'),
              SizedBox(height: 10),
              Image.network('data:image/png;base64,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'), // replace with your icon URL
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

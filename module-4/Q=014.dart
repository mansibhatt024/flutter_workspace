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
              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSZ6F59EaM28TJWf7I0Li2fzwHpOLV_NCCgg&usqp=CAU'),
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

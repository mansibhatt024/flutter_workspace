import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Call App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _checkAndRequestPhonePermission();
  }

  Future<void> _checkAndRequestPhonePermission() async {
    var status = await Permission.phone.status;
    if (status.isDenied) {
      // Show dialog to request permission
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Permission Request'),
          content: Text('This app needs phone call permission to function properly.'),
          actions: <Widget>[
           ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _requestPhonePermission();
              },
              child: Text('Allow'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Deny'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _requestPhonePermission() async {
    await Permission.phone.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Call App'),
      ),
      body: Center(
        child: Text('Welcome to the Phone Call App!'),
      ),
    );
  }}

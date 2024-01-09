//27. Create an Android Application which Manage Activity Lifecycle
// Stages and Showing Toast with Performing Different Stages.
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    showToast("initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showToast("didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    showToast("build");
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Lifecycle Demo'),
      ),
      body: Center(
        child: Text('Check console for lifecycle messages.'),
      ),
    );
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    showToast("didUpdateWidget");
  }

  @override
  void dispose() {
    showToast("dispose");
    super.dispose();
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }
}

//29. Call via urllauncher, Send Sms via urllauncher
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
  void _makePhoneCall() async {
    const phoneNumber = 'tel:+919714155651'; // Replace with the desired phone number
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  void _sendSms() async {
    const smsNumber = 'sms:+919714155651'; // Replace with the desired phone number
    if (await canLaunch(smsNumber)) {
      await launch(smsNumber);
    } else {
      throw 'Could not launch $smsNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('URL Launcher Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _makePhoneCall,
              child: Text('Make Phone Call'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendSms,
              child: Text('Send SMS'),
            ),
          ],
        ),
      ),
    );
  }
}

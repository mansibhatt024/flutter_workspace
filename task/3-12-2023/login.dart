import 'package:flutter/material.dart';

import 'order.dart';
class loginpage extends StatefulWidget {
  @override
  loginpageState createState() => loginpageState();
}

class loginpageState extends State<loginpage> {
  var name = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN PAGE"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Login Form"),
            SizedBox(width: 10, height: 10),
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Enter Your Name",
                prefixIcon: Icon(Icons.person_add_rounded),
              ),
            ),
            SizedBox(width: 10, height: 10),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Your Password",
                prefixIcon: Icon(Icons.lock),

              ),
            ),
            SizedBox(width: 10, height: 10),
            ElevatedButton(
              onPressed: () {
                if (password.text.toString() == "12345" &&
                    name.text.toString() == "user") {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => order()),
                  );
                } else {
                  print("Please check your password and name");
                }
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
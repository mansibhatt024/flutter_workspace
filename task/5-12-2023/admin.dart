import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminPage extends StatefulWidget {
  @override
  AdminPageState createState() => AdminPageState();
}

class AdminPageState extends State<AdminPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  bool one = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Form", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: userName,
                decoration: InputDecoration(
                  labelText: "Enter your Name",
                  prefixIcon: Icon(Icons.person),
                ),
                onFieldSubmitted: (value) {
                  userName.text = value.toString();
                },
                onSaved: (value) {
                  userName.text = value.toString();
                },
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Enter your Name";
                  }
                  return null;
                },
              ),
              SizedBox(
                width: 10,
                height: 10,
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                  labelText: "Enter your password",
                  prefixIcon: Icon(Icons.lock),
                ),
                onFieldSubmitted: (value) {
                  password.text = value.toString();
                },
                onSaved: (value) {
                  password.text = value.toString();
                },
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Enter Password";
                  }
                  return null;
                },
              ),
              SizedBox(
                width: 10,
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  submit();
                  if (password.text == "1111" && userName.text == "admin") {
                    Fluttertoast.showToast(
                      msg: "Login Successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      webBgColor: "linear-gradient(to right, #33ccff, #ff99cc)",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      fontSize: 20,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => OrderPage()),
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: "Login Fail, Try Again",
                      toastLength: Toast.LENGTH_SHORT,
                      webBgColor: "linear-gradient(to right, #33ccff, #ff99cc)",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      fontSize: 20,
                    );
                    print("Enter Correct Password");
                  }
                },
                child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      print("Data Process");
    }
  }
}

OrderPage() {
}

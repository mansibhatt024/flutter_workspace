import 'package:flutter/material.dart';
import 'package:project/splashscreen.dart';
import 'product.dart';


void main() {
  runApp( MaterialApp(
    theme: ThemeData(primaryColor: Colors.blue,
      appBarTheme: AppBarTheme
        (
        backgroundColor: Colors.green, //use your hex code here
      ),
    ),
    darkTheme: ThemeData(primarySwatch: Colors.pink),
    color: Colors.amberAccent,
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyForm2 extends StatefulWidget {
  const MyForm2({Key? key}) : super(key: key);

  @override
  MyForm2State createState() => MyForm2State();
}

class MyForm2State extends State<MyForm2> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  late String name, email, pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text("login form", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              const SizedBox(
                width: 10,
                height: 10,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Enter Your Name"),
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  name = value.toString();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a Proper Name!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                width: 10,
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Enter Your Email"),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value.toString();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a Proper Email!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                width: 10,
                height: 10,
              ),
              TextFormField(
                controller: passController,
                decoration: const InputDecoration(labelText: "Enter Your Password"),
                keyboardType: TextInputType.text,
                obscureText: true,
                onSaved: (value) {
                  pass = value.toString();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a Proper Password!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                width: 10,
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  _submit();
                  print("Clicked Successfully $name, $email, $pass");
                  if (pass == "12345") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const MyHomePage(),
                      ),
                    );
                  } else {
                    print("Enter the correct password");
                  }
                },
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("Data Processing");
    }
  }
}

//11. Create login and registration form
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login and Registration Form',
      home: loginscreen(),
    );
  }
}

class loginscreen extends StatefulWidget {
  @override
  loginscreenstate createState() => loginscreenstate();
}

class loginscreenstate extends State<loginscreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle the login button press
  void _handleLogin() {
    // Implement your login logic here
    String email = _emailController.text;
    String password = _passwordController.text;

    // Print or process the entered email and password
    print('Login: Email: $email, Password: $password');
  }

  // Function to handle the registration button press
  void _handleRegistration() {
    // Implement your registration logic here
    String email = _emailController.text;
    String password = _passwordController.text;

    // Print or process the entered email and password
    print('Registration: Email: $email, Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login and Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: Text('Login'),
                ),
                ElevatedButton(
                  onPressed: _handleRegistration,
                  child: Text('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

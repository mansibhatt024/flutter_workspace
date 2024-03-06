import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../appColors.dart';
import 'loginpage.dart' as LoginPage;
import '../widget.dart' as CustomWidget;

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  void signup() async {
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String password = passwordController.text.trim();
    String cPassword = cPasswordController.text.trim();

    if (email.isEmpty || name.isEmpty || password.isEmpty || cPassword.isEmpty) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return CustomWidget.MyBottomSheetContent(context, 'Please fill all details!');
        },
      );
    } else if (password != cPassword) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return CustomWidget.MyBottomSheetContent(context, 'Passwords do not match!');
        },
      );
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
            'uid': userCredential.user!.uid,
            'email': email,
            'name': name,
          });

          showModalBottomSheet(
            context: context,
            builder: (context) {
              return CustomWidget.MyBottomSheetContent(context, 'Successfully signed up...', isSuc: true);
            },
          );

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage.LoginPage()));
        }
      } on FirebaseAuthException catch (ex) {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return CustomWidget.MyBottomSheetContent(context, ex.code.toString().replaceAll(RegExp('[-_]'), ' '));
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.05,),
            Icon(Icons.chat, size: size.height * 0.14, color: primeColor,),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text('Chatter', style: TextStyle(color: primeColor, fontSize: 28, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: size.height * 0.05,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: CustomWidget.CustomTextField(
                controller: nameController,
                hintText: 'Name',
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Icon(Icons.account_circle, color: primeColor,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: CustomWidget.CustomTextField(
                controller: emailController,
                hintText: 'Email',
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Icon(Icons.email, color: primeColor,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: CustomWidget.CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Icon(Icons.lock, color: primeColor,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: CustomWidget.CustomTextField(
                controller: cPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Icon(Icons.lock, color: primeColor,),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: CustomWidget.CustomButton(onPressed: () {
                signup();
              }, text: 'SIGNUP'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage.LoginPage()));
                },
                child: Text('Already have an account? Go to login', style: TextStyle(color: primeColor, fontSize: 16, fontWeight: FontWeight.normal),),
              ),
            ),
            SizedBox(height: size.height * 0.1,),
            Text('Made with \u{1F49F} by mansidev', style: TextStyle(color: primeColor, fontSize: 16, fontWeight: FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}

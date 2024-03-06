import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'appColors.dart';
import 'pages/FirstPage.dart';
import 'pages/homepage2.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid?
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyCsygYYKkvNmoL5GnB4EDIKf1X_N2VUFUg',
        appId: '1:78408221160:android:cb9df80a9b6dd98219645d',
        messagingSenderId: '78408221160',
        projectId: 'flutter-8f4de'),
  ):Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Notebook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primeColor),
        useMaterial3: true,
      ),
      home: (FirebaseAuth.instance.currentUser != null)?HomePage2():FirstPage(),
    );
  }
}




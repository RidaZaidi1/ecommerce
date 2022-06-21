import 'package:ecommerce_app/auth/login.dart';
import 'package:ecommerce_app/auth/register.dart';
import 'package:ecommerce_app/auth/splash.dart';
import 'package:ecommerce_app/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      routes: {
        "/login": (context) => Login(),
        "/register": (context) => Register(),
        "/home": (context) => Home(),
      },
    );
  }
}

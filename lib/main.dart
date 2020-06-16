import 'package:cryptoinfo/ui/login/login.dart';
import 'package:cryptoinfo/ui/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Info',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Poppins'
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
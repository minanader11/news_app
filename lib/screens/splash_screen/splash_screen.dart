import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen/presentaion/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
   static const String routeName='splash_screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3), // Change the duration as needed
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:  Image.asset('assets/images/splash.png')
    );
  }
}

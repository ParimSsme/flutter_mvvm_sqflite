import 'dart:async';
import 'package:flutter/material.dart';
import '../../config/router/routes.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () => AppNavigator.replaceWith(Routes.tabs));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('شاعران',
            style: TextStyle(
                fontSize: 35,
                decoration: TextDecoration.none,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}

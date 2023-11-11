import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../router/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () => AppNavigator.push(Routes.home));
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

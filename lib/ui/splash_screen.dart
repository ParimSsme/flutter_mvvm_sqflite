import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'modules/home/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>
                Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => HomePage()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/images/logo.png',
            //   height: 150,
            // ),

            // const SizedBox(height: 40),
            //
            const Text('شاعران',
          style: TextStyle(
              fontSize: 35,
              decoration: TextDecoration.none,
              color: Colors.black,
              fontWeight: FontWeight.bold
          )
      ),
          ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite_mvvm_design/config/theme/app_theme.dart';
import 'package:sqflite_mvvm_design/ui/modules/home/home_page.dart';
import 'package:sqflite_mvvm_design/ui/modules/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),// Decides which theme to show, light or dark.
    );
  }
}

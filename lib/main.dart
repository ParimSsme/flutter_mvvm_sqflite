import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite_mvvm_design/config/theme/app_theme.dart';
import 'config/router/app_routes.dart';
import 'core/base/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      navigatorObservers: [routeObserver],
      initialRoute: '/',
      onGenerateRoute: _router.route,// Decides which theme to show, light or dark.
    );
  }
}

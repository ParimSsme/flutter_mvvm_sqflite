import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/config/theme/app_theme.dart';
import '../providers/poet_model.dart';
import 'package:provider/provider.dart';
import 'config/router/routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PoetModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.onGenerateRoute,
    );
  }
}

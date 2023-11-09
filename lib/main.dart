import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/config/theme/app_theme.dart';
import '../providers/poet_model.dart';
import 'config/router/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PoetModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      // navigatorObservers: [routeObserver],
      initialRoute: '/',
      onGenerateRoute: _router.route,// Decides which theme to show, light or dark.
    );
  }
}

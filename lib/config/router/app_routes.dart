import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/ui/modules/home/screen.dart';

import '../../ui/modules/home/viewmodel.dart';

class AppRouter {
  Route<dynamic>? route(RouteSettings settings) {
    final arguments = settings.arguments as Map<String, dynamic>? ?? {};

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HomeScreen(viewModel: HomeScreenViewModel()),
        );

      default:
        throw Exception('Route ${settings.name} not implemented');
    }
  }
}
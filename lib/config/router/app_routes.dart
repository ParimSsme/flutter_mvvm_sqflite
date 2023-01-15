import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/ui/modules/home/screen.dart';
import 'package:sqflite_mvvm_design/ui/modules/poet_edit/poet_edit.dart';
import 'package:sqflite_mvvm_design/ui/modules/poet_info/poet_info.dart';
import 'package:sqflite_mvvm_design/ui/modules/poet_info/viewmodel.dart';
import '../../data/models/Poet.dart';
import '../../ui/modules/home/viewmodel.dart';
import '../../ui/modules/poet_edit/viewmodel.dart';

class AppRouter {
  Route<dynamic>? route(RouteSettings settings) {
    final arguments = settings.arguments as Map<String, dynamic>? ?? {};

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HomeScreen(viewModel: HomeScreenViewModel()),
        );

      case '/poet_info':
        final poet = arguments['poet'] as Poet?;

        if (poet == null) {
          throw Exception('Route ${settings.name} requires a category');
        }

        return MaterialPageRoute(
          settings: settings,
          builder: (_) => PoetInfoScreen(
            viewModel: PoetInfoScreenViewModel(
                poet: poet
            ),
          ),
        );

        case '/poet_edit':
        final poet = arguments['poet'] as Poet?;

        if (poet == null) {
          throw Exception('Route ${settings.name} requires a category');
        }

        return MaterialPageRoute(
          settings: settings,
          builder: (_) => PoetEditScreen(
            viewModel: PoetEditScreenViewModel(
                poet: poet
            ),
          ),
        );

      default:
        throw Exception('Route ${settings.name} not implemented');
    }
  }
}
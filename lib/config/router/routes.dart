import 'package:flutter/cupertino.dart';
import 'package:sqflite_mvvm_design/ui/modules/add_poet/screen.dart';
import 'package:sqflite_mvvm_design/ui/modules/home/screen.dart';
import 'package:sqflite_mvvm_design/ui/modules/poet_edit/poet_edit.dart';
import 'package:sqflite_mvvm_design/ui/modules/poet_info/poet_info.dart';
import '../../ui/modules/splash_screen.dart';
import 'fade_page_route.dart';

enum Routes {
  splash,
  home,
  poetEdit,
  poetInfo,
  addPoet,
}

class _Paths {
  static const String splash = '/';
  static const String home = '/home';
  static const String poetEdit = '/poetEdit';
  static const String poetInfo = '/poetInfo';
  static const String addPoet = '/addPoet';

  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.home: _Paths.home,
    Routes.poetEdit: _Paths.poetEdit,
    Routes.poetInfo: _Paths.poetInfo,
    Routes.addPoet: _Paths.addPoet,
  };

  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {

    final arguments = settings.arguments as List<String>?;
    final id = arguments?.first ?? '1';

    switch (settings.name) {
      case _Paths.splash:
        return FadeRoute(page: SplashScreen());

      case _Paths.home:
        return FadeRoute(page: HomeScreen());

      case _Paths.poetEdit:
        return FadeRoute(page: PoetEditScreen(id: id));

      case _Paths.poetInfo:
        return FadeRoute(page: PoetInfoScreen(id: id));

      case _Paths.addPoet:
        return FadeRoute(page: AddPoetScreen());

      default:
        return FadeRoute(page: HomeScreen());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}

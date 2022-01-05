import 'package:bottom_app/config/route_paths.dart';
import 'package:bottom_app/screens/home/home_page.dart';
import 'package:bottom_app/screens/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: const RouteSettings(name: '/'),
            builder: (_) => const Scaffold());

      case RoutePaths.Splash:
        return CupertinoPageRoute(
            builder: (context) => const SplashScreen(),
            settings: RouteSettings(
                name: RoutePaths.Splash, arguments: settings.arguments));

      case RoutePaths.Home:
        return CupertinoPageRoute(
            builder: (context) => HomePage(),
            settings: const RouteSettings(name: RoutePaths.Home));

      default:
        return _errorRoute();
    }
  }

  static Route onGenerateNestedRoute(RouteSettings settings) {
    print('Nested Route: ${settings.name}');
    // this is where you define the nested routes.
    switch (settings.name) {
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../core/widgets/not_found_widget.dart';
import '../features/food/screen/home/home_screen.dart';
import '../features/splash/screens/splash_screen.dart';

class AppRouter {
  static Route onRute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );
      case 'home':
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const NotFoundWidget();
          },
        );
    }
  }
}

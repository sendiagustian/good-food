import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodfood/features/presentations/bloc/splash/splash_bloc.dart';
import 'package:goodfood/features/presentations/screens/food_detail/food_detail_screen.dart';
import 'package:goodfood/features/presentations/screens/home/home_screen.dart';
import 'package:goodfood/features/presentations/screens/splash_screen.dart';

import '../features/presentations/widgets/not_found_widget.dart';

class AppRouter {
  static Route onRute(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => SplashBloc(context: context),
              child: const SplashScreen(),
            );
          },
        );
      case 'home':
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );
      case 'food-detail':
        return MaterialPageRoute(
          builder: (context) {
            return const FoodDetailScreen();
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

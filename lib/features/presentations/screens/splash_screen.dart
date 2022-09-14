import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodfood/features/presentations/bloc/splash/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashBloc splash = context.read<SplashBloc>();
    return BlocBuilder<SplashBloc, Duration>(
      bloc: splash,
      builder: (context, state) {
        Timer(state, splash.navigate); // Navigate to home at 3 seconds
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(
                child: Text(
                  'GoodFood',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 42,
                  ),
                ),
              ),
              SizedBox(height: 32),
              CircularProgressIndicator()
            ],
          ),
        );
      },
    );
  }
}

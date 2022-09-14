import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/splash/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      bloc: SplashBloc(context),
      builder: (context, state) {
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

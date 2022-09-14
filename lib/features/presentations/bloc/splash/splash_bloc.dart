import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SplashBloc extends Cubit<Duration> {
  final BuildContext context;
  final Duration timer;
  SplashBloc({
    required this.context,
    this.timer = const Duration(seconds: 3),
  }) : super(timer);

  void navigate() {
    Navigator.of(context).pushReplacementNamed('home');
  }
}

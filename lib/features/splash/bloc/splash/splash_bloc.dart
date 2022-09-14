import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final BuildContext context;

  SplashBloc(this.context) : super(SplashStartState()) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('home');
    });
  }
}

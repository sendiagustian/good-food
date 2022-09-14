import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodfood/data/db/app_database.dart';
import 'package:goodfood/features/food/repositories/food_repository.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'features/food/bloc/food/food_bloc.dart';

void main() {
  runApp(
    Provider<AppDatabase>(
      create: (context) => AppDatabase(),
      child: const AppBloc(),
      dispose: (context, db) => db.close(),
    ),
  );
}

class AppBloc extends StatelessWidget {
  const AppBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => FoodRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FoodBloc(
              context: context,
              repository: RepositoryProvider.of<FoodRepository>(context),
            )..add(LoadFoodEvent()),
          ),
        ],
        child: const App(),
      ),
    );
  }
}

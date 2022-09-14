import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../data/db/app_database.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final BuildContext context;

  late List<FoodEntityData> foodEntities;

  FavoriteBloc(this.context) : super(FavoriteLoading()) {
    final AppDatabase dbHelper = Provider.of<AppDatabase>(
      context,
      listen: false,
    );

    on<LoadFavoriteEvent>((event, emit) async {
      foodEntities = await dbHelper.getFoodFavorites();
      emit(FavoriteLoaded(foodEntities));
    });

    on<UpdateFavoriteEvent>((event, emit) async {
      await dbHelper.updateFoodEntity(event.entity.foodId.value, event.entity);
      foodEntities = await dbHelper.getFoodFavorites();
      emit(FavoriteLoaded(foodEntities));
    });

    on<RefreshFavoriteEvent>((event, emit) async {
      foodEntities = await dbHelper.getFoodFavorites();
      emit(FavoriteLoaded(foodEntities));
    });
  }
}

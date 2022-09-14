import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodfood/data/db/app_database.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/food_model.dart';
import '../../repositories/food_repository.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final FoodRepository repository;
  final BuildContext context;

  late List<FoodModel> foods;
  late List<FoodEntityData> foodEntities;

  FoodBloc({
    required this.repository,
    required this.context,
  }) : super(FoodLoadingState()) {
    final AppDatabase dbHelper = Provider.of<AppDatabase>(
      context,
      listen: false,
    );
    on<LoadFoodEvent>((event, emit) async {
      foods = [];
      emit(FoodLoadingState());
      try {
        final foodsRespone = await repository.getFoods();
        if (foodsRespone != null) {
          foodEntities = await dbHelper.getFoodEntitis();
          if (foodEntities.isEmpty ||
              foodEntities.length != foodsRespone.length) {
            dbHelper.deleteEverything();
            for (var food in foodsRespone) {
              foods.add(FoodModel.fromJson(food));
              FoodEntityCompanion foodEntity = FoodEntityCompanion(
                foodFavorite: Value(FoodModel.fromJson(food).foodFavorite),
                foodThumb: Value(FoodModel.fromJson(food).foodThumb),
                foodId: Value(int.parse(FoodModel.fromJson(food).foodId)),
                foodName: Value(FoodModel.fromJson(food).foodName),
                foodCategory: Value(FoodModel.fromJson(food).foodCategory),
                foodArea: Value(FoodModel.fromJson(food).foodArea),
                foodInstructions:
                    Value(FoodModel.fromJson(food).foodInstructions),
                foodTags: Value(FoodModel.fromJson(food).foodTags),
                foodVideo: Value(FoodModel.fromJson(food).foodVideo),
              );
              dbHelper.insertFoodEntity(foodEntity);
            }
            if (foods.length == foodsRespone.length) {
              foodEntities = await dbHelper.getFoodEntitis();
              emit(FoodLoadedState(foodEntities));
            } else {
              emit(FoodErrorState('Food belum terbasa semua'));
            }
          }
          emit(FoodLoadedState(foodEntities));
        } else {
          emit(FoodErrorState('foodsRespone null - No internet access'));
        }
      } catch (e) {
        emit(FoodErrorState(e.toString()));
      }
    });

    on<UpdateFoodEvent>((event, emit) async {
      await dbHelper.updateFoodEntity(event.entity.foodId.value, event.entity);
      foodEntities = await dbHelper.getFoodEntitis();
      emit(FoodLoadedState(foodEntities));
    });

    on<RefreshFoodEvent>((event, emit) async {
      foodEntities = await dbHelper.getFoodEntitis();
      emit(FoodLoadedState(foodEntities));
    });
  }
}

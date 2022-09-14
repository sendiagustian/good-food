import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodfood/data/db/app_database.dart';
import 'package:provider/provider.dart';

part 'detail_food_event.dart';
part 'detail_food_state.dart';

class DetailFoodBloc extends Bloc<DetailFoodEvent, DetailFoodState> {
  final BuildContext context;

  DetailFoodBloc(this.context) : super(DetailFoodLoading()) {
    final AppDatabase dbHelper = Provider.of<AppDatabase>(
      context,
      listen: false,
    );
    on<InitialDataById>((event, emit) async {
      FoodEntityData entityData =
          await dbHelper.getFoodEntity(event.entity.foodId);
      emit(DetailFoodLoaded(entityData));
    });

    on<UpdateDataById>((event, emit) async {
      await dbHelper.updateFoodEntity(
        event.entity.foodId.value,
        event.entity,
      );
      FoodEntityData entityData =
          await dbHelper.getFoodEntity(event.entity.foodId.value);
      emit(DetailFoodLoaded(entityData));
    });

    on<RefreshDataFood>((event, emit) async {
      FoodEntityData entityData =
          await dbHelper.getFoodEntity(event.entity.foodId);
      emit(DetailFoodLoaded(entityData));
    });
  }
}

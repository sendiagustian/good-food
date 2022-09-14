part of 'food_bloc.dart';

abstract class FoodState {}

class FoodLoadingState extends FoodState {}

class FoodErrorState extends FoodState {
  final String message;
  FoodErrorState(this.message);
}

class FoodLoadedState extends FoodState {
  final List<FoodEntityData> model;
  FoodLoadedState(this.model);
}

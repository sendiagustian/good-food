part of 'detail_food_bloc.dart';

abstract class DetailFoodState {}

class DetailFoodLoading extends DetailFoodState {}

class DetailFoodError extends DetailFoodState {
  final String message;
  DetailFoodError(this.message);
}

class DetailFoodLoaded extends DetailFoodState {
  final FoodEntityData entity;
  DetailFoodLoaded(this.entity);
}

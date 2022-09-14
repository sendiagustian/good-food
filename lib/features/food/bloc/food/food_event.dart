part of 'food_bloc.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent();

  @override
  List<Object> get props => [];
}

class LoadFoodEvent extends FoodEvent {}

class UpdateFoodEvent extends FoodEvent {
  final FoodEntityCompanion entity;
  const UpdateFoodEvent(this.entity);
}

class RefreshFoodEvent extends FoodEvent {}

part of 'detail_food_bloc.dart';

abstract class DetailFoodEvent extends Equatable {
  const DetailFoodEvent();

  @override
  List<Object> get props => [];
}

class InitialDataById extends DetailFoodEvent {
  final FoodEntityData entity;
  const InitialDataById(this.entity);
}

class UpdateDataById extends DetailFoodEvent {
  final FoodEntityCompanion entity;
  const UpdateDataById(this.entity);
}

class RefreshDataFood extends DetailFoodEvent {
  final FoodEntityData entity;
  const RefreshDataFood(this.entity);
}

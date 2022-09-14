part of 'favorite_bloc.dart';

abstract class FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<FoodEntityData> model;
  FavoriteLoaded(this.model);
}

class FavoriteError extends FavoriteState {
  final String message;
  FavoriteError(this.message);
}

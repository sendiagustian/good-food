part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavoriteEvent extends FavoriteEvent {}

class UpdateFavoriteEvent extends FavoriteEvent {
  final FoodEntityCompanion entity;
  const UpdateFavoriteEvent(this.entity);
}

class RefreshFavoriteEvent extends FavoriteEvent {}

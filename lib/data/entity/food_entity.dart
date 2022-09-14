import 'package:drift/drift.dart';

class FoodEntity extends Table {
  IntColumn get foodId => integer()();
  BoolColumn get foodFavorite => boolean().named('food_favorite')();
  TextColumn get foodThumb => text().named('food_thumb')();
  TextColumn get foodName => text().named('food_name')();
  TextColumn get foodCategory => text().named('food_category')();
  TextColumn get foodArea => text().named('food_area')();
  TextColumn get foodInstructions => text().named('food_intructions')();
  TextColumn? get foodTags => text().nullable()();
  TextColumn? get foodVideo => text().nullable()();
}

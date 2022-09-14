import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../entity/food_entity.dart';

part 'app_database.g.dart';

LazyDatabase? _database;

LazyDatabase _openConnection() {
  if (_database != null) return _database!;
  _database = LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'food.sqlite'));
    return NativeDatabase(file);
  });
  return _database!;
}

@DriftDatabase(tables: [FoodEntity])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<FoodEntityData>> getFoodFavorites() async {
    return await (select(foodEntity)
          ..where((tbl) => tbl.foodFavorite.equals(true)))
        .get();
  }

  Future<List<FoodEntityData>> getFoodEntitis() async {
    return await select(foodEntity).get();
  }

  Future<FoodEntityData> getFoodEntity(int id) async {
    return await (select(foodEntity)..where((tbl) => tbl.foodId.equals(id)))
        .getSingle();
  }

  Future updateFoodEntity(int id, FoodEntityCompanion entity) async {
    return await (update(foodEntity)..where((tbl) => tbl.foodId.equals(id)))
        .write(entity);
  }

  Future<int> insertFoodEntity(FoodEntityCompanion entity) async {
    return await into(foodEntity).insert(entity);
  }

  Future<int> deleteFoodEntity(int id) async {
    return await (delete(foodEntity)..where((tbl) => tbl.foodId.equals(id)))
        .go();
  }

  Future<void> deleteEverything() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }
}

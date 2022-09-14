// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class FoodEntityData extends DataClass implements Insertable<FoodEntityData> {
  final int foodId;
  final bool foodFavorite;
  final String foodThumb;
  final String foodName;
  final String foodCategory;
  final String foodArea;
  final String foodInstructions;
  final String? foodTags;
  final String? foodVideo;
  const FoodEntityData(
      {required this.foodId,
      required this.foodFavorite,
      required this.foodThumb,
      required this.foodName,
      required this.foodCategory,
      required this.foodArea,
      required this.foodInstructions,
      this.foodTags,
      this.foodVideo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['food_id'] = Variable<int>(foodId);
    map['food_favorite'] = Variable<bool>(foodFavorite);
    map['food_thumb'] = Variable<String>(foodThumb);
    map['food_name'] = Variable<String>(foodName);
    map['food_category'] = Variable<String>(foodCategory);
    map['food_area'] = Variable<String>(foodArea);
    map['food_intructions'] = Variable<String>(foodInstructions);
    if (!nullToAbsent || foodTags != null) {
      map['food_tags'] = Variable<String>(foodTags);
    }
    if (!nullToAbsent || foodVideo != null) {
      map['food_video'] = Variable<String>(foodVideo);
    }
    return map;
  }

  FoodEntityCompanion toCompanion(bool nullToAbsent) {
    return FoodEntityCompanion(
      foodId: Value(foodId),
      foodFavorite: Value(foodFavorite),
      foodThumb: Value(foodThumb),
      foodName: Value(foodName),
      foodCategory: Value(foodCategory),
      foodArea: Value(foodArea),
      foodInstructions: Value(foodInstructions),
      foodTags: foodTags == null && nullToAbsent
          ? const Value.absent()
          : Value(foodTags),
      foodVideo: foodVideo == null && nullToAbsent
          ? const Value.absent()
          : Value(foodVideo),
    );
  }

  factory FoodEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FoodEntityData(
      foodId: serializer.fromJson<int>(json['foodId']),
      foodFavorite: serializer.fromJson<bool>(json['foodFavorite']),
      foodThumb: serializer.fromJson<String>(json['foodThumb']),
      foodName: serializer.fromJson<String>(json['foodName']),
      foodCategory: serializer.fromJson<String>(json['foodCategory']),
      foodArea: serializer.fromJson<String>(json['foodArea']),
      foodInstructions: serializer.fromJson<String>(json['foodInstructions']),
      foodTags: serializer.fromJson<String?>(json['foodTags']),
      foodVideo: serializer.fromJson<String?>(json['foodVideo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'foodId': serializer.toJson<int>(foodId),
      'foodFavorite': serializer.toJson<bool>(foodFavorite),
      'foodThumb': serializer.toJson<String>(foodThumb),
      'foodName': serializer.toJson<String>(foodName),
      'foodCategory': serializer.toJson<String>(foodCategory),
      'foodArea': serializer.toJson<String>(foodArea),
      'foodInstructions': serializer.toJson<String>(foodInstructions),
      'foodTags': serializer.toJson<String?>(foodTags),
      'foodVideo': serializer.toJson<String?>(foodVideo),
    };
  }

  FoodEntityData copyWith(
          {int? foodId,
          bool? foodFavorite,
          String? foodThumb,
          String? foodName,
          String? foodCategory,
          String? foodArea,
          String? foodInstructions,
          Value<String?> foodTags = const Value.absent(),
          Value<String?> foodVideo = const Value.absent()}) =>
      FoodEntityData(
        foodId: foodId ?? this.foodId,
        foodFavorite: foodFavorite ?? this.foodFavorite,
        foodThumb: foodThumb ?? this.foodThumb,
        foodName: foodName ?? this.foodName,
        foodCategory: foodCategory ?? this.foodCategory,
        foodArea: foodArea ?? this.foodArea,
        foodInstructions: foodInstructions ?? this.foodInstructions,
        foodTags: foodTags.present ? foodTags.value : this.foodTags,
        foodVideo: foodVideo.present ? foodVideo.value : this.foodVideo,
      );
  @override
  String toString() {
    return (StringBuffer('FoodEntityData(')
          ..write('foodId: $foodId, ')
          ..write('foodFavorite: $foodFavorite, ')
          ..write('foodThumb: $foodThumb, ')
          ..write('foodName: $foodName, ')
          ..write('foodCategory: $foodCategory, ')
          ..write('foodArea: $foodArea, ')
          ..write('foodInstructions: $foodInstructions, ')
          ..write('foodTags: $foodTags, ')
          ..write('foodVideo: $foodVideo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(foodId, foodFavorite, foodThumb, foodName,
      foodCategory, foodArea, foodInstructions, foodTags, foodVideo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FoodEntityData &&
          other.foodId == this.foodId &&
          other.foodFavorite == this.foodFavorite &&
          other.foodThumb == this.foodThumb &&
          other.foodName == this.foodName &&
          other.foodCategory == this.foodCategory &&
          other.foodArea == this.foodArea &&
          other.foodInstructions == this.foodInstructions &&
          other.foodTags == this.foodTags &&
          other.foodVideo == this.foodVideo);
}

class FoodEntityCompanion extends UpdateCompanion<FoodEntityData> {
  final Value<int> foodId;
  final Value<bool> foodFavorite;
  final Value<String> foodThumb;
  final Value<String> foodName;
  final Value<String> foodCategory;
  final Value<String> foodArea;
  final Value<String> foodInstructions;
  final Value<String?> foodTags;
  final Value<String?> foodVideo;
  const FoodEntityCompanion({
    this.foodId = const Value.absent(),
    this.foodFavorite = const Value.absent(),
    this.foodThumb = const Value.absent(),
    this.foodName = const Value.absent(),
    this.foodCategory = const Value.absent(),
    this.foodArea = const Value.absent(),
    this.foodInstructions = const Value.absent(),
    this.foodTags = const Value.absent(),
    this.foodVideo = const Value.absent(),
  });
  FoodEntityCompanion.insert({
    required int foodId,
    required bool foodFavorite,
    required String foodThumb,
    required String foodName,
    required String foodCategory,
    required String foodArea,
    required String foodInstructions,
    this.foodTags = const Value.absent(),
    this.foodVideo = const Value.absent(),
  })  : foodId = Value(foodId),
        foodFavorite = Value(foodFavorite),
        foodThumb = Value(foodThumb),
        foodName = Value(foodName),
        foodCategory = Value(foodCategory),
        foodArea = Value(foodArea),
        foodInstructions = Value(foodInstructions);
  static Insertable<FoodEntityData> custom({
    Expression<int>? foodId,
    Expression<bool>? foodFavorite,
    Expression<String>? foodThumb,
    Expression<String>? foodName,
    Expression<String>? foodCategory,
    Expression<String>? foodArea,
    Expression<String>? foodInstructions,
    Expression<String>? foodTags,
    Expression<String>? foodVideo,
  }) {
    return RawValuesInsertable({
      if (foodId != null) 'food_id': foodId,
      if (foodFavorite != null) 'food_favorite': foodFavorite,
      if (foodThumb != null) 'food_thumb': foodThumb,
      if (foodName != null) 'food_name': foodName,
      if (foodCategory != null) 'food_category': foodCategory,
      if (foodArea != null) 'food_area': foodArea,
      if (foodInstructions != null) 'food_intructions': foodInstructions,
      if (foodTags != null) 'food_tags': foodTags,
      if (foodVideo != null) 'food_video': foodVideo,
    });
  }

  FoodEntityCompanion copyWith(
      {Value<int>? foodId,
      Value<bool>? foodFavorite,
      Value<String>? foodThumb,
      Value<String>? foodName,
      Value<String>? foodCategory,
      Value<String>? foodArea,
      Value<String>? foodInstructions,
      Value<String?>? foodTags,
      Value<String?>? foodVideo}) {
    return FoodEntityCompanion(
      foodId: foodId ?? this.foodId,
      foodFavorite: foodFavorite ?? this.foodFavorite,
      foodThumb: foodThumb ?? this.foodThumb,
      foodName: foodName ?? this.foodName,
      foodCategory: foodCategory ?? this.foodCategory,
      foodArea: foodArea ?? this.foodArea,
      foodInstructions: foodInstructions ?? this.foodInstructions,
      foodTags: foodTags ?? this.foodTags,
      foodVideo: foodVideo ?? this.foodVideo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (foodId.present) {
      map['food_id'] = Variable<int>(foodId.value);
    }
    if (foodFavorite.present) {
      map['food_favorite'] = Variable<bool>(foodFavorite.value);
    }
    if (foodThumb.present) {
      map['food_thumb'] = Variable<String>(foodThumb.value);
    }
    if (foodName.present) {
      map['food_name'] = Variable<String>(foodName.value);
    }
    if (foodCategory.present) {
      map['food_category'] = Variable<String>(foodCategory.value);
    }
    if (foodArea.present) {
      map['food_area'] = Variable<String>(foodArea.value);
    }
    if (foodInstructions.present) {
      map['food_intructions'] = Variable<String>(foodInstructions.value);
    }
    if (foodTags.present) {
      map['food_tags'] = Variable<String>(foodTags.value);
    }
    if (foodVideo.present) {
      map['food_video'] = Variable<String>(foodVideo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodEntityCompanion(')
          ..write('foodId: $foodId, ')
          ..write('foodFavorite: $foodFavorite, ')
          ..write('foodThumb: $foodThumb, ')
          ..write('foodName: $foodName, ')
          ..write('foodCategory: $foodCategory, ')
          ..write('foodArea: $foodArea, ')
          ..write('foodInstructions: $foodInstructions, ')
          ..write('foodTags: $foodTags, ')
          ..write('foodVideo: $foodVideo')
          ..write(')'))
        .toString();
  }
}

class $FoodEntityTable extends FoodEntity
    with TableInfo<$FoodEntityTable, FoodEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _foodIdMeta = const VerificationMeta('foodId');
  @override
  late final GeneratedColumn<int> foodId = GeneratedColumn<int>(
      'food_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _foodFavoriteMeta =
      const VerificationMeta('foodFavorite');
  @override
  late final GeneratedColumn<bool> foodFavorite = GeneratedColumn<bool>(
      'food_favorite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (food_favorite IN (0, 1))');
  final VerificationMeta _foodThumbMeta = const VerificationMeta('foodThumb');
  @override
  late final GeneratedColumn<String> foodThumb = GeneratedColumn<String>(
      'food_thumb', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _foodNameMeta = const VerificationMeta('foodName');
  @override
  late final GeneratedColumn<String> foodName = GeneratedColumn<String>(
      'food_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _foodCategoryMeta =
      const VerificationMeta('foodCategory');
  @override
  late final GeneratedColumn<String> foodCategory = GeneratedColumn<String>(
      'food_category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _foodAreaMeta = const VerificationMeta('foodArea');
  @override
  late final GeneratedColumn<String> foodArea = GeneratedColumn<String>(
      'food_area', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _foodInstructionsMeta =
      const VerificationMeta('foodInstructions');
  @override
  late final GeneratedColumn<String> foodInstructions = GeneratedColumn<String>(
      'food_intructions', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _foodTagsMeta = const VerificationMeta('foodTags');
  @override
  late final GeneratedColumn<String> foodTags = GeneratedColumn<String>(
      'food_tags', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _foodVideoMeta = const VerificationMeta('foodVideo');
  @override
  late final GeneratedColumn<String> foodVideo = GeneratedColumn<String>(
      'food_video', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        foodId,
        foodFavorite,
        foodThumb,
        foodName,
        foodCategory,
        foodArea,
        foodInstructions,
        foodTags,
        foodVideo
      ];
  @override
  String get aliasedName => _alias ?? 'food_entity';
  @override
  String get actualTableName => 'food_entity';
  @override
  VerificationContext validateIntegrity(Insertable<FoodEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('food_id')) {
      context.handle(_foodIdMeta,
          foodId.isAcceptableOrUnknown(data['food_id']!, _foodIdMeta));
    } else if (isInserting) {
      context.missing(_foodIdMeta);
    }
    if (data.containsKey('food_favorite')) {
      context.handle(
          _foodFavoriteMeta,
          foodFavorite.isAcceptableOrUnknown(
              data['food_favorite']!, _foodFavoriteMeta));
    } else if (isInserting) {
      context.missing(_foodFavoriteMeta);
    }
    if (data.containsKey('food_thumb')) {
      context.handle(_foodThumbMeta,
          foodThumb.isAcceptableOrUnknown(data['food_thumb']!, _foodThumbMeta));
    } else if (isInserting) {
      context.missing(_foodThumbMeta);
    }
    if (data.containsKey('food_name')) {
      context.handle(_foodNameMeta,
          foodName.isAcceptableOrUnknown(data['food_name']!, _foodNameMeta));
    } else if (isInserting) {
      context.missing(_foodNameMeta);
    }
    if (data.containsKey('food_category')) {
      context.handle(
          _foodCategoryMeta,
          foodCategory.isAcceptableOrUnknown(
              data['food_category']!, _foodCategoryMeta));
    } else if (isInserting) {
      context.missing(_foodCategoryMeta);
    }
    if (data.containsKey('food_area')) {
      context.handle(_foodAreaMeta,
          foodArea.isAcceptableOrUnknown(data['food_area']!, _foodAreaMeta));
    } else if (isInserting) {
      context.missing(_foodAreaMeta);
    }
    if (data.containsKey('food_intructions')) {
      context.handle(
          _foodInstructionsMeta,
          foodInstructions.isAcceptableOrUnknown(
              data['food_intructions']!, _foodInstructionsMeta));
    } else if (isInserting) {
      context.missing(_foodInstructionsMeta);
    }
    if (data.containsKey('food_tags')) {
      context.handle(_foodTagsMeta,
          foodTags.isAcceptableOrUnknown(data['food_tags']!, _foodTagsMeta));
    }
    if (data.containsKey('food_video')) {
      context.handle(_foodVideoMeta,
          foodVideo.isAcceptableOrUnknown(data['food_video']!, _foodVideoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  FoodEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FoodEntityData(
      foodId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}food_id'])!,
      foodFavorite: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}food_favorite'])!,
      foodThumb: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}food_thumb'])!,
      foodName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}food_name'])!,
      foodCategory: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}food_category'])!,
      foodArea: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}food_area'])!,
      foodInstructions: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}food_intructions'])!,
      foodTags: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}food_tags']),
      foodVideo: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}food_video']),
    );
  }

  @override
  $FoodEntityTable createAlias(String alias) {
    return $FoodEntityTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $FoodEntityTable foodEntity = $FoodEntityTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [foodEntity];
}

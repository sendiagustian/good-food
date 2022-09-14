import 'package:goodfood/features/data/models/food_model.dart';

abstract class FoodRepository {
  Future<List<FoodModel>> getFoods();
  Future<List<String>> getFoodCategories();
  Future<List<FoodModel>> filterFoodByCategories(String category);
}

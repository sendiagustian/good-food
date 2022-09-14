import 'package:equatable/equatable.dart';

class FoodModel extends Equatable {
  final String foodId;
  final String foodName;
  final String foodCategory;
  final String foodArea;
  final String foodInstructions;
  final String foodThumb;
  final String foodTags;
  final String foodVideo;
  final String drinkAlternate;

  const FoodModel({
    required this.foodId,
    required this.foodName,
    required this.foodCategory,
    required this.foodArea,
    required this.foodInstructions,
    required this.foodThumb,
    required this.foodTags,
    required this.foodVideo,
    required this.drinkAlternate,
  });

  @override
  List<FoodModel> get props => [
        FoodModel(
          foodId: foodId,
          foodName: foodName,
          foodCategory: foodCategory,
          foodArea: foodArea,
          foodInstructions: foodInstructions,
          foodThumb: foodThumb,
          foodTags: foodTags,
          foodVideo: foodVideo,
          drinkAlternate: drinkAlternate,
        )
      ];

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      foodId: json['idMeal'],
      foodName: json['strMeal'],
      foodCategory: json['strCategory'],
      foodArea: json['strArea'],
      foodInstructions: json['strInstructions'],
      foodThumb: json['strMealThumb'],
      foodTags: json['strTags'],
      foodVideo: json['strYoutube'],
      drinkAlternate: json['strDrinkAlternate'],
    );
  }
}

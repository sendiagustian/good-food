class FoodModel {
  final bool foodFavorite;
  final String foodId;
  final String foodThumb;
  final String foodName;
  final String foodCategory;
  final String foodArea;
  final String foodInstructions;
  final String? foodTags;
  final String? foodVideo;

  const FoodModel({
    required this.foodFavorite,
    required this.foodId,
    required this.foodName,
    required this.foodCategory,
    required this.foodArea,
    required this.foodInstructions,
    required this.foodThumb,
    required this.foodTags,
    required this.foodVideo,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      foodFavorite: json['foodFavorite'] ?? false,
      foodId: json['idMeal'],
      foodName: json['strMeal'],
      foodCategory: json['strCategory'],
      foodArea: json['strArea'],
      foodInstructions: json['strInstructions'],
      foodThumb: json['strMealThumb'],
      foodTags: json['strTags'],
      foodVideo: json['strYoutube'],
    );
  }
}

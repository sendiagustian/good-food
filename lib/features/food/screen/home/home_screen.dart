import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goodfood/data/db/app_database.dart';
import 'package:goodfood/features/food/bloc/food/food_bloc.dart';
import 'package:goodfood/features/food/screen/food_detail/food_detail_screen.dart';

import '../../bloc/detail_food/detail_food_bloc.dart';
import '../../repositories/food_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FoodBloc foodBloc = context.read<FoodBloc>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 23,
                    height: 3.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 12,
                    height: 3.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        title: const Text('GoodFood'),
        actions: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () async {
              FoodRepository().getFoods();
            },
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 80,
            width: 1.sw,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    offset: const Offset(1.5, 1.5),
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
              child: TextField(
                // controller: TODO ADD CONTROLLER
                onTap: () {
                  // TODO ON TAP ACTION
                },
                style: TextStyle(
                  fontSize: 14.0.sp,
                  color: Colors.black,
                ),
                keyboardType: TextInputType.text,
                // focusNode: , TODO ADD FOCUS NODE
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: "Search GoodFood!",
                  hintStyle: const TextStyle(
                    color: Color(0xffc4c4c4),
                    fontSize: 14,
                  ),
                ),
                maxLines: 1,
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<FoodBloc, FoodState>(
              builder: (context, state) {
                if (state is FoodLoadedState) {
                  return RefreshIndicator(
                    onRefresh: () {
                      foodBloc.add(RefreshFoodEvent());
                      return Future.value();
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.model.length,
                      itemBuilder: (context, index) {
                        return _buildItemFood(
                          context: context,
                          food: state.model[index],
                          foodBloc: foodBloc,
                        );
                      },
                    ),
                  );
                } else if (state is FoodErrorState) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemFood({
    required BuildContext context,
    required FoodEntityData food,
    required FoodBloc foodBloc,
  }) {
    List<String> tags = food.foodTags != null ? food.foodTags!.split(',') : [];
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return BlocProvider(
                  create: (context) => DetailFoodBloc(context)
                    ..add(
                      InitialDataById(food),
                    ),
                  child: const FoodDetailScreen(),
                );
              },
            ),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  placeholder: 'assets/images/placeholder_content.png',
                  image: food.foodThumb,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${food.foodName} - ${food.foodArea}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    food.foodCategory,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey[700],
                    ),
                  ),
                  Wrap(
                    children: List.generate(
                      tags.length,
                      (index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 5, top: 5),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(.3),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            tags[index],
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                FoodEntityCompanion entity = FoodEntityCompanion(
                  foodFavorite: drift.Value(!food.foodFavorite),
                  foodThumb: drift.Value(food.foodThumb),
                  foodId: drift.Value(food.foodId),
                  foodName: drift.Value(food.foodName),
                  foodCategory: drift.Value(food.foodCategory),
                  foodArea: drift.Value(food.foodArea),
                  foodInstructions: drift.Value(food.foodInstructions),
                  foodTags: drift.Value(food.foodTags),
                  foodVideo: drift.Value(food.foodVideo),
                );
                foodBloc.add(UpdateFoodEvent(entity));
              },
              icon: food.foodFavorite
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite_border,
                    ),
            )
          ],
        ),
      ),
    );
  }
}

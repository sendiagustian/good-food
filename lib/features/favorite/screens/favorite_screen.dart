import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goodfood/data/db/app_database.dart';
import 'package:goodfood/features/favorite/bloc/favorite/favorite_bloc.dart';
import 'package:goodfood/features/food/screen/food_detail/food_detail_screen.dart';

import '../../food/bloc/detail_food/detail_food_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteBloc foodBloc = context.read<FavoriteBloc>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Favorite Food'),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoaded) {
            return RefreshIndicator(
              onRefresh: () {
                foodBloc.add(RefreshFavoriteEvent());
                return Future.value();
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.model.length,
                itemBuilder: (context, index) {
                  return _buildItemFood(
                    context: context,
                    favorite: state.model[index],
                    favoriteBloc: foodBloc,
                  );
                },
              ),
            );
          } else if (state is FavoriteError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildItemFood({
    required BuildContext context,
    required FoodEntityData favorite,
    required FavoriteBloc favoriteBloc,
  }) {
    List<String> tags =
        favorite.foodTags != null ? favorite.foodTags!.split(',') : [];
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
                      InitialDataById(favorite),
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
                  image: favorite.foodThumb,
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
                    '${favorite.foodName} - ${favorite.foodArea}',
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
                    favorite.foodCategory,
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
                  foodFavorite: drift.Value(!favorite.foodFavorite),
                  foodThumb: drift.Value(favorite.foodThumb),
                  foodId: drift.Value(favorite.foodId),
                  foodName: drift.Value(favorite.foodName),
                  foodCategory: drift.Value(favorite.foodCategory),
                  foodArea: drift.Value(favorite.foodArea),
                  foodInstructions: drift.Value(favorite.foodInstructions),
                  foodTags: drift.Value(favorite.foodTags),
                  foodVideo: drift.Value(favorite.foodVideo),
                );
                favoriteBloc.add(UpdateFavoriteEvent(entity));
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:drift/drift.dart' as drift;
import 'package:goodfood/features/food/bloc/detail_food/detail_food_bloc.dart';

import '../../../../data/db/app_database.dart';

class FoodDetailScreen extends StatelessWidget {
  const FoodDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DetailFoodBloc detailFoodBloc = context.read<DetailFoodBloc>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Detail Food',
        ),
      ),
      body: BlocBuilder<DetailFoodBloc, DetailFoodState>(
        builder: (context, state) {
          if (state is DetailFoodLoaded) {
            List<String> tags = state.entity.foodTags != null
                ? state.entity.foodTags!.split(',')
                : [];
            return RefreshIndicator(
              onRefresh: () {
                detailFoodBloc.add(RefreshDataFood(state.entity));
                return Future.value();
              },
              child: ListView(
                children: [
                  SizedBox(
                    width: 1.sw,
                    height: 1.sh * .3,
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: const AssetImage(
                        'assets/images/placeholder_content.png',
                      ),
                      image: NetworkImage(state.entity.foodThumb),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${state.entity.foodName} - ${state.entity.foodArea}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24.0,
                              ),
                            ),
                            IconButton(
                              onPressed: (() {
                                FoodEntityCompanion entity =
                                    FoodEntityCompanion(
                                  foodFavorite:
                                      drift.Value(!state.entity.foodFavorite),
                                  foodThumb:
                                      drift.Value(state.entity.foodThumb),
                                  foodId: drift.Value(state.entity.foodId),
                                  foodName: drift.Value(state.entity.foodName),
                                  foodCategory:
                                      drift.Value(state.entity.foodCategory),
                                  foodArea: drift.Value(state.entity.foodArea),
                                  foodInstructions: drift.Value(
                                      state.entity.foodInstructions),
                                  foodTags: drift.Value(state.entity.foodTags),
                                  foodVideo:
                                      drift.Value(state.entity.foodVideo),
                                );
                                detailFoodBloc.add(UpdateDataById(entity));
                              }),
                              icon: state.entity.foodFavorite
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 30,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      size: 30,
                                    ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          children: List.generate(tags.length, (index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 5),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(.3),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(tags[index]),
                            );
                          }),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Intruction:',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(state.entity.foodInstructions)
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is DetailFoodError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

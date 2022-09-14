import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodDetailScreen extends StatelessWidget {
  const FoodDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Detail Food',
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            width: 1.sw,
            height: 1.sh * .3,
            child: const FadeInImage(
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/images/placeholder_content.png'),
              image: NetworkImage(
                  'https://www.themealdb.com/images/media/meals/58oia61564916529.jpg'),
            ), // FadeInImage
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Fish Pie',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(.3),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text('Side'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(.3),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text('Turkish'),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Price',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                    '01.Put the potatoes in a large pan of cold salted water and bring to the boil. Lower the heat, cover, then simmer gently for 15 minutes until tender. Drain, then return to the pan over a low heat for 30 seconds to drive off any excess water. Mash with 1 tbsp olive oil, then season.\r\n02.Meanwhile put the milk in a large sauté pan, add the fish and bring to the boil. Remove from the heat, cover and stand for 3 minutes. Remove the fish (reserving the milk) and pat dry with kitchen paper, then gently flake into an ovenproof dish, discarding the skin and any bones.\r\n03.Heat the remaining oil in a pan, stir in the flour and cook for 30 seconds. Gradually stir in 200-250ml of the reserved milk (discard the rest). Grate in nutmeg, season, then bubble until thick. Stir in the cream.\r\n04.Preheat the oven to 190°C/fan170°C/gas 5. Grate the artichokes and add to the dish with the leek, prawns and herbs. Stir the lemon zest and juice into the sauce, then pour over. Mix gently with a wooden spoon.\r\n05.Spoon the mash onto the fish mixture, then use a fork to make peaks, which will crisp and brown as it cooks. Sprinkle over the cheese, then bake for 35-40 minutes until golden and bubbling. Serve with wilted greens.')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

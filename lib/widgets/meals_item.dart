import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsItem extends StatelessWidget {
  const MealsItem({required this.meal, required this.mealsdeatil, super.key});

  final void Function() mealsdeatil;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  final Meal meal;
  @override
  Widget build(context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: mealsdeatil,
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Color.fromARGB(168, 0, 51, 44),
                child: Center(
                  child: Column(
                    spacing: 5,
                    children: [
                      Text(
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        meal.title,
                        style: GoogleFonts.gentiumBookPlus(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                      MealItemTrait(
                        label: '${meal.duration} min',
                        icon: Icons.watch_later_rounded,
                        label2: '$affordabilityText ',
                        label3: '$complexityText ',

                        icon2: Icons.attach_money,

                        icon3: Icons.cookie,
                      ),
                      const SizedBox(height: 1),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

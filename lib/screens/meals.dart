import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/screens/meal_item_detail.dart';
import 'package:meals/widgets/meals_item.dart';

class mealsScreen extends StatelessWidget {
  const mealsScreen({required this.meals, super.key});

  void ontoggle(context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => MealItemDetailScreen(meal: meal)),
    );
  }

  final List<Meal> meals;

  @override
  Widget build(context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealsItem(
        meal: meals[index],
        mealsdeatil: () {
          ontoggle(context, meals[index]);
        },
      ),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Text(
            'OH O! Nothing Here, Try adding some meals as Favourites',
            softWrap: true,
            maxLines: 3,
            style: GoogleFonts.gentiumBookPlus(
              fontSize: 22,
              color: Color.fromARGB(255, 177, 223, 217),
            ),
          ),
        ),
      );
    }

    return Scaffold(body: content);
  }
}

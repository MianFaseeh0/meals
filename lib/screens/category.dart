import 'package:flutter/material.dart';
import 'package:meals/Data/dummy_data.dart';
import 'package:meals/model/catogary.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_item.dart';

class categoryScreen extends StatelessWidget {
  const categoryScreen({required this.availablemeals, super.key});

  final List<Meal> availablemeals;
  void selectCatogary(context, Catogary category) {
    final filterredMealc = dummyMeals
        .where((meals) => meals.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => mealsScreen(meals: filterredMealc)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        childAspectRatio: 1.7,
      ),
      children: [
        for (final category in availableCategories)
          CategoryItem(
            categories: category,
            gotomeals: () {
              selectCatogary(context, category);
            },
          ),
      ],
    );
  }
}

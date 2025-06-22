import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/providers/favourites_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItemDetailScreen extends ConsumerWidget {
  const MealItemDetailScreen({required this.meal, super.key});

  final Meal meal;
  @override
  Widget build(context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final check = ref
                  .read(favmealsProvider.notifier)
                  .togglrmealfavstatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    check ? 'Meal is Added' : 'Meal is removed',
                    style: GoogleFonts.gentiumBookPlus(
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              );
            },
            icon: Icon(Icons.star, color: Color.fromARGB(255, 177, 223, 217)),
          ),
        ],
        title: Text(
          softWrap: true,
          maxLines: 1,
          meal.title,
          style: GoogleFonts.gentiumBookPlus(
            fontSize: 24,
            color: Color.fromARGB(255, 177, 223, 217),
          ),
        ),
      ),
      body: ListView(
        children: [
          Card(
            elevation: 13,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.hardEdge,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 13,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingredients: ',
                    style: GoogleFonts.gentiumBookPlus(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  for (final ingredients in meal.ingredients)
                    Text(
                      '- $ingredients',
                      style: GoogleFonts.gentiumBookPlus(fontSize: 17),
                    ),
                  const SizedBox(height: 15),
                  Text(
                    'Steps: ',
                    style: GoogleFonts.gentiumBookPlus(fontSize: 22),
                  ),
                  const SizedBox(height: 10),
                  for (final steps in meal.steps)
                    Text(
                      '- $steps',
                      style: GoogleFonts.gentiumBookPlus(fontSize: 17),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

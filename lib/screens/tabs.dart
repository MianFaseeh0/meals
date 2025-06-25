import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/Data/dummy_data.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/providers/favourites_provider.dart';
import 'package:meals/screens/category.dart';
import 'package:meals/screens/favourites.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/widgets/drawer.dart';
import 'package:meals/providers/filters_provider.dart';

class Tabscreen extends ConsumerStatefulWidget {
  const Tabscreen({super.key});

  @override
  ConsumerState<Tabscreen> createState() {
    return _TabscreenState();
  }
}

class _TabscreenState extends ConsumerState<Tabscreen> {
  List<Meal> meal = [];

  int _selectedIndex = 0;

  void _selextPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _selectScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(builder: (ctx) => FiltersScreen()),
      );
    }
  }

  void _removefavourite(Meal meal) {
    final favme = ref.watch(favmealsProvider);
    final mealindex = favme.indexOf(meal);
    setState(() {
      favme.remove(meal);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        content: const Text('favourite removed'),
        action: SnackBarAction(
          label: 'undo',
          onPressed: () {
            setState(() {
              favme.insert(mealindex, meal);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    final activeFilters = ref.watch(filtersProvider);
    final availablemeals = dummyMeals.where((meal) {
      if (activeFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      if (activeFilters[Filters.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    var title = 'Categories';
    Widget activeSreen = categoryScreen(availablemeals: availablemeals);
    if (_selectedIndex == 1) {
      final favmeals = ref.watch(favmealsProvider);
      activeSreen = FavouriteScreen(
        meals: favmeals,
        onremovemeal: _removefavourite,
      );
      title = 'Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 33, 33),
      ),
      drawer: Drawerwidget(onSelectScreen: _selectScreen),

      body: activeSreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selextPage,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}

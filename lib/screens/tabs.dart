import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/Data/dummy_data.dart';
import 'package:meals/providers/favourites_provider.dart';
import 'package:meals/screens/account.dart';
import 'package:meals/screens/category.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/drawer.dart';

const kInitialFilters = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegan: false,
  Filters.vegetarian: false,
};

class tabscreen extends ConsumerStatefulWidget {
  const tabscreen({super.key});

  @override
  ConsumerState<tabscreen> createState() {
    return _tabscreen();
  }
}

class _tabscreen extends ConsumerState<tabscreen> {
  int _selectedIndex = 0;

  Map<Filters, bool> _selectedFilters = kInitialFilters;

  void _selextPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _selectScreen(String identifier) async {
    if (identifier == 'Filters') {
      final result = await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
      );

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    } else if (identifier == 'Account') {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => const accountScreen()));
    } else {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => const tabscreen()));
    }
  }

  @override
  Widget build(context) {
    final availablemeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filters.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    var title = 'Categories';
    Widget activeSreen = categoryScreen(availablemeals: availablemeals);
    if (_selectedIndex == 1) {
      final favmeals = ref.watch(favmealsProvider);
      activeSreen = mealsScreen(meals: favmeals);
      title = 'Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: GoogleFonts.gentiumBookPlus(
            color: Color.fromARGB(255, 177, 223, 217),
            fontWeight: FontWeight.w600,
          ),
        ),
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

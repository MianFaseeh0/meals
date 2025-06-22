import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFilterSet = false;
  var _lactoseFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Favourites Filter')),
      body: PopScope(
        onPopInvokedWithResult: (didPop, result) async =>
            Navigator.of(context).pop({
              Filters.glutenFree: _glutenFilterSet,
              Filters.lactoseFree: _lactoseFilterSet,
              Filters.vegan: _veganFilterSet,
              Filters.vegetarian: _vegetarianFilterSet,
            }),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwitchListTile(
              value: _glutenFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFilterSet = isChecked;
                });
              },
              title: Text(
                'Gluten-Free',
                style: GoogleFonts.gentiumBookPlus(
                  color: Color.fromARGB(255, 177, 223, 217),
                  fontSize: 22,
                ),
              ),
              subtitle: Text(
                'Only Add Gluten-Free Meals.',
                style: GoogleFonts.gentiumBookPlus(
                  color: Color.fromARGB(255, 177, 223, 217),
                  fontSize: 15,
                ),
              ),
            ),

            SwitchListTile(
              value: _lactoseFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose-Free',
                style: GoogleFonts.gentiumBookPlus(
                  color: Color.fromARGB(255, 177, 223, 217),
                  fontSize: 22,
                ),
              ),
              subtitle: Text(
                'Only Add Lactose-Free Meals.',
                style: GoogleFonts.gentiumBookPlus(
                  color: Color.fromARGB(255, 177, 223, 217),
                  fontSize: 15,
                ),
              ),
            ),

            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              title: Text(
                'vegan-Free',
                style: GoogleFonts.gentiumBookPlus(
                  color: Color.fromARGB(255, 177, 223, 217),
                  fontSize: 22,
                ),
              ),
              subtitle: Text(
                'Only include Vegan meals.',
                style: GoogleFonts.gentiumBookPlus(
                  color: Color.fromARGB(255, 177, 223, 217),
                  fontSize: 15,
                ),
              ),
            ),

            SwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegeterian',
                style: GoogleFonts.gentiumBookPlus(
                  color: Color.fromARGB(255, 177, 223, 217),
                  fontSize: 22,
                ),
              ),
              subtitle: Text(
                'Only Add Vegetarian Meals.',
                style: GoogleFonts.gentiumBookPlus(
                  color: Color.fromARGB(255, 177, 223, 217),
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

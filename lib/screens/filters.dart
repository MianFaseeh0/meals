import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({required this.currentFilters, super.key});

  final Map<Filters, bool> currentFilters;

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
  void initState() {
    super.initState();
    _glutenFilterSet = widget.currentFilters[Filters.glutenFree]!;
    _lactoseFilterSet = widget.currentFilters[Filters.lactoseFree]!;
    _veganFilterSet = widget.currentFilters[Filters.vegan]!;
    _vegetarianFilterSet = widget.currentFilters[Filters.vegetarian]!;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Favourites Filter')),
      body: //PopScope(
          //onPopInvokedWithResult: (didPop, result) async =>
          // Navigator.of(context).pop({
          //   Filters.glutenFree: _glutenFilterSet,
          //   Filters.lactoseFree: _lactoseFilterSet,
          //   Filters.vegan: _veganFilterSet,
          //   Filters.vegetarian: _vegetarianFilterSet,
          // }),
          // child:
          Column(
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
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                subtitle: Text(
                  'Only Add Gluten-Free Meals.',
                  style: GoogleFonts.gentiumBookPlus(
                    color: Colors.white,
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
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                subtitle: Text(
                  'Only Add Lactose-Free Meals.',
                  style: GoogleFonts.gentiumBookPlus(
                    color: Colors.white,
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
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                subtitle: Text(
                  'Only include Vegan meals.',
                  style: GoogleFonts.gentiumBookPlus(
                    color: Colors.white,
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
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                subtitle: Text(
                  'Only Add Vegetarian Meals.',
                  style: GoogleFonts.gentiumBookPlus(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 120),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop({
                    Filters.glutenFree: _glutenFilterSet,
                    Filters.lactoseFree: _lactoseFilterSet,
                    Filters.vegan: _veganFilterSet,
                    Filters.vegetarian: _vegetarianFilterSet,
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                ),

                child: Text(
                  'Save',
                  style: GoogleFonts.gentiumBookPlus(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Drawerwidget extends StatelessWidget {
  const Drawerwidget({required this.onSelectScreen, super.key});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.onPrimaryFixedVariant,

                  Theme.of(context).colorScheme.onTertiary,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              color: Theme.of(context).colorScheme.onTertiaryContainer,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  color: Color.fromARGB(255, 177, 223, 217),
                  size: 40,
                ),
                const SizedBox(width: 10),
                Text(
                  'Cooking Up',
                  style: GoogleFonts.gentiumBookPlus(
                    fontSize: 30,
                    color: Color.fromARGB(255, 177, 223, 217),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            splashColor: Theme.of(context).colorScheme.onTertiaryFixedVariant,
            onTap: () {
              onSelectScreen('Home');
            },
            leading: Icon(
              Icons.fastfood_rounded,
              color: Color.fromARGB(255, 177, 223, 217),
            ),

            title: Text(
              'Home',
              style: GoogleFonts.gentiumBookPlus(
                color: Color.fromARGB(255, 177, 223, 217),
              ),
            ),
          ),

          ListTile(
            splashColor: Theme.of(context).colorScheme.onTertiaryFixedVariant,
            onTap: () {
              onSelectScreen('Account');
            },
            leading: Icon(
              Icons.account_circle,
              color: Color.fromARGB(255, 177, 223, 217),
            ),

            title: Text(
              'Account',
              style: GoogleFonts.gentiumBookPlus(
                color: Color.fromARGB(255, 177, 223, 217),
              ),
            ),
          ),

          ListTile(
            splashColor: Theme.of(context).colorScheme.onTertiaryFixedVariant,
            onTap: () {
              onSelectScreen('Filters');
            },
            leading: Icon(
              Icons.settings_rounded,
              color: Color.fromARGB(255, 177, 223, 217),
            ),

            title: Text(
              'Filters',
              style: GoogleFonts.gentiumBookPlus(
                color: Color.fromARGB(255, 177, 223, 217),
              ),
            ),
          ),
          // Listtile(gototitlescreen: gototitlescreen, title: title),
          // Listtile(gototitlescreen: gototitlescreen2, title: title2),
          // Listtile(gototitlescreen: gototitlescreen3, title: title3),
        ],
      ),
    );
  }
}

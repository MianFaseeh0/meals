import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/model/catogary.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.categories,
    required this.gotomeals,
    super.key,
  });

  final void Function() gotomeals;
  final Catogary categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: gotomeals,
        splashColor: categories.color,
        borderRadius: BorderRadius.circular(25),

        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              colors: [
                categories.color.withAlpha(200),
                categories.color.withAlpha(90),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          padding: EdgeInsets.all(20),

          child: Text(
            categories.title,
            style: GoogleFonts.gentiumBookPlus(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

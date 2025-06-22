import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({
    required this.label,
    required this.icon,
    required this.label2,
    required this.icon2,
    required this.label3,
    required this.icon3,
    super.key,
  });

  final IconData icon;
  final String label;

  final IconData icon2;
  final String label2;

  final IconData icon3;
  final String label3;

  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        Icon(icon, color: Colors.white),
        Text(
          label,
          style: GoogleFonts.gentiumBookPlus(fontSize: 14, color: Colors.white),
        ),

        Icon(icon2, color: Colors.white),
        Text(
          label2,
          style: GoogleFonts.gentiumBookPlus(fontSize: 14, color: Colors.white),
        ),
        Icon(icon3, color: Colors.white),
        Text(
          label3,
          style: GoogleFonts.gentiumBookPlus(fontSize: 14, color: Colors.white),
        ),
      ],
    );
  }
}

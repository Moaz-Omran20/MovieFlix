import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListTitle extends StatelessWidget {
  String title;

  CustomListTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.rubik(
          fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

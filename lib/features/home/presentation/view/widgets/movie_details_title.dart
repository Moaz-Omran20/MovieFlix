import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetailsTitle extends StatelessWidget {

  String title;


  MovieDetailsTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        width: MediaQuery.of(context).size.width * .25,
        child:  Padding(
          padding: EdgeInsets.only(left: 6.0),
          child: Text(title,style: GoogleFonts.rubik(fontSize: 13),),
        )) ;
  }
}

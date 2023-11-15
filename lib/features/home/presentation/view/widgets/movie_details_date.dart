import 'package:flutter/material.dart';

class MovieDetailsDate extends StatelessWidget {

  String date;


  MovieDetailsDate({required this.date});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .25,
      child:  Padding(
        padding: EdgeInsets.only(left: 6),
        child: Text(
          date,
          style: TextStyle(color: Color(0xFFB5B4B4),fontSize: 12),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/related_movies_listVIew.dart';

import '../../../../../constants.dart';
import '../../../../home/presentation/view/widgets/custom_list_title.dart';

class RelatedMovies extends StatelessWidget {

  String title;


  RelatedMovies({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kMoviesListColor,
      height: MediaQuery.of(context).size.height*.4 ,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14, left: 19),
                child: CustomListTitle(title: title),
              )
            ],
          ),
           const Padding(
            padding: EdgeInsets.only(left: 19, top: 12),
            child: Row(
              children: [
                RelatedMoviesListView(),
              ],
            ),
          )
        ],
      ),
    ) ;
  }
}

import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/view/widgets/recomended_section/custom_listView_recommended.dart';

import '../../../../../../constants.dart';
import '../custom_list_title.dart';

class RecommendedSection extends StatelessWidget {

  String title;


  RecommendedSection({super.key, required this.title});

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
                CustomListViewRecommended(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

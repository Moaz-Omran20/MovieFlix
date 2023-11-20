import 'package:flutter/material.dart';

import '../../../../../../constants.dart';
import 'custom_listView_new_release.dart';
import '../custom_list_title.dart';

class NewReleasesSection extends StatelessWidget {
  const NewReleasesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kMoviesListColor,
      height: MediaQuery.of(context).size.height*.27,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14, left: 19),
                child: CustomListTitle(title: "New Releases"),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 19, top: 12),
            child: Row(
              children: [
                CustomListViewNewRelease(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/features/watch_list/presentation/view/widgets/watch_list_view_listView_body.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,top: 15 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("WatchList",
            style: GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.bold),),
          const SizedBox(height: 15,),
           const WatchListViewListViewBody(),
        ],
      ),
    );
  }
}

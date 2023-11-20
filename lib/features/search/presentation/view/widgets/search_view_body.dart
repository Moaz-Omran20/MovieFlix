import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/features/search/presentation/view/widgets/searched_listView.dart';
import 'package:movies_app/features/search/presentation/view_model/cubits/search_cubit/search_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            cursorColor: kPrimaryColor,
            onSubmitted: (value) {
              BlocProvider.of<SearchCubit>(context)
                  .fetchSearchedMovies(name: value);
            },
            onChanged: (value) {
              BlocProvider.of<SearchCubit>(context)
                  .fetchSearchedMovies(name: value);
            },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: kPrimaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: "Search",
              suffixIcon: const Icon(
                Icons.search_outlined,
                color: kPrimaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Search Results",
            style: GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          const SearchedListView(),
        ],
      ),
    );
  }
}

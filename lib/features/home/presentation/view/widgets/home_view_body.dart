import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/api_services.dart';
import 'package:movies_app/core/utils/app_images.dart';
import 'package:movies_app/features/categories/data/repo/category_implementation.dart';
import 'package:movies_app/features/categories/presentation/view_model/cubits/get_categories_cubit/get_categories_cubit.dart';
import 'package:movies_app/features/search/data/repo/search_implementation.dart';
import 'package:movies_app/features/watch_list/presentation/view_model/cubits/add_movie_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/view_model/cubits/fetch_movies_cubit/fetch_favourite_movies_cubit.dart';

import '../../../../categories/presentation/view/categories_view.dart';
import '../../../../search/presentation/view/search_view.dart';
import '../../../../search/presentation/view_model/cubits/search_cubit/search_cubit.dart';
import '../../../../watch_list/presentation/view/watch_list_view.dart';
import '../home_nav_bar_view_body.dart';

class HomeViewBody extends StatefulWidget {
  int selected = 0;
  List<Widget> views = [
    const HomeNavBarView(),
    BlocProvider(
        create: (context) =>
            SearchCubit(SearchImplementation(ApiService(Dio()))),
        child: const SearchView()),
    BlocProvider(
        create: (context) => GetCategoriesCubit(
              CategoryImplementation(ApiService(Dio())),
            ),
        child: const CategoriesView()),
    BlocProvider(
        create: (context) => FetchFavouriteMoviesCubit(), child: const WatchListView())
  ];

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "MovieFlix",
            style: GoogleFonts.rubik(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          leading: Image.asset(AppImages.logo1),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              widget.selected = value;
              setState(() {});
            },
            iconSize: 27,
            unselectedFontSize: 10,
            backgroundColor: const Color(0xFF101010),
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            showUnselectedLabels: true,
            unselectedItemColor: kIconsColor,
            currentIndex: widget.selected,
            selectedItemColor: kPrimaryColor,
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/Home icon.png"),
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined), label: "Search"),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage("assets/images/Icon material-movie.png")),
                  label: "Browse"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmarks_outlined), label: "WatchList"),
            ]),
        body: IndexedStack(index: widget.selected, children: widget.views),
      ),
    );
  }
}

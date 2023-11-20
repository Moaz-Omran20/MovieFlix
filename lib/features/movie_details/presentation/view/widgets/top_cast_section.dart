import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/shared.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/top_cast_item.dart';
import 'package:movies_app/features/movie_details/presentation/view_model/cubits/top_casts_cubit/top_casts_cubit.dart';
import '../../../../../constants.dart';
import '../../../../home/presentation/view/widgets/custom_list_title.dart';

class TopCastSection extends StatelessWidget {
  const TopCastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kMoviesListColor,
      height: MediaQuery.of(context).size.height * .4,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14, left: 19),
                child: CustomListTitle(title: "Top Cast"),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19, top: 12),
            child: Row(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * .3,
                    width: MediaQuery.of(context).size.width * .93,
                    child: BlocBuilder<TopCastsCubit, TopCastsState>(
                      builder: (context, state) {
                        if(state is TopCastsSuccess)
                          {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 14.7),
                                  child: TopCastItem(state.topCasts[index]),
                                );
                              },
                              physics: const BouncingScrollPhysics(),
                              itemCount: state.topCasts.length,
                            );
                          }
                        else if(state is TopCastsFailure)
                          {
                            return Text(state.errMessage);
                          }
                        else
                          {
                            return const LoadingIndicator();
                          }
                      },
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

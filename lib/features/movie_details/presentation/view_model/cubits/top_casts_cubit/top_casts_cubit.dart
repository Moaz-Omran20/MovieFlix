import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/movie_details/data/movie_detail_repo/movie_detail_imlementation.dart';
import '../../../../data/models/top_cast_model/TopCastModel.dart';
part 'top_casts_state.dart';

class TopCastsCubit extends Cubit<TopCastsState> {
  TopCastsCubit(this.topCasts) : super(TopCastsInitial());

  MovieDetailImplementation topCasts;

  Future<void> fetchMovieTopCasts(num id) async {
    emit(TopCastsLoading());
    var results = await topCasts.fetchMovieTopCasts(id: id);
    results.fold((failure) => emit(TopCastsFailure(failure.errMessage)),
        (topCasts) => emit(TopCastsSuccess(topCasts)));
  }
}

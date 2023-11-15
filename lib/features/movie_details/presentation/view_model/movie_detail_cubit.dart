import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/movie_details/data/models/movie_detail_model/MovieDetailModel.dart';
import 'package:movies_app/features/movie_details/data/movie_detail_repo/movie_detail_repo.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit(this.movieDetailRepo) : super(MovieDetailInitial());
  final MovieDetailRepo movieDetailRepo ;

  Future<void> fetchMovieDetail({required num id})
  async{
    emit(MovieDetailLoading());
    try {
      var results = await movieDetailRepo.fetchMovieDetails(id: id);
      emit(MovieDetailSuccess(results));
    }
    catch(e)
    {
      throw "UnExpected error , try again later";
    }

  }


}

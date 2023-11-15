import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/categories/data/repo/category_repo.dart';

import '../../../../../home/data/models/movie_model/MovieModel.dart';

part 'get_movies_by_category_state.dart';

class GetMoviesByCategoryCubit extends Cubit<GetMoviesByCategoryState> {
  GetMoviesByCategoryCubit(this.categoryRepo)
      : super(GetMoviesByCategoryInitial());

  final CategoryRepo categoryRepo;

  Future<void> getMoviesByCategory({required num id}) async {
    emit(GetMoviesByCategoryLoading());
    var results = await categoryRepo.fetchMoviesByCategory(id: id);
    results.fold(
        (failure) => emit(GetMoviesByCategoryFailure(failure.errMessage)),
        (movies) => emit(GetMoviesByCategorySuccess(movies)));
  }
}

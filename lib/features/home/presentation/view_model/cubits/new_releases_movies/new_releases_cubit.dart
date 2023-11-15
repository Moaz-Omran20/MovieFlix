import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/home/data/models/new_releases_model/NewReleasesModel.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';

import '../../../../data/models/movie_model/MovieModel.dart';
part 'new_releases_state.dart';

class NewReleasesCubit extends Cubit<NewReleasesState> {
  NewReleasesCubit(this.homeRepo) : super(NewReleasesInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewReleasesMovies() async {
    emit(NewReleasesLoading());
    var results = await homeRepo.fetchMoviesNewReleases();
    results.fold((failure) => emit(NewReleasesFailure(failure.errMessage)),
        (newReleasesMovies) => emit(NewReleasesSuccess(newReleasesMovies)));
  }
}

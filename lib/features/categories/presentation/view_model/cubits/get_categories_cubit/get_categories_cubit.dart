import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/categories/data/repo/category_implementation.dart';

import '../../../../data/models/CategoryModel.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit(this.categoryImplementation)
      : super(GetCategoriesInitial());
  CategoryImplementation categoryImplementation;

  Future<void> getAllCategories() async {
    var results = await categoryImplementation.fetchCategories();
    results.fold((failure) => emit(GetCategoriesFailure(failure.errMessage)),
        (categories) => emit(GetCategoriesSuccess(categories)));
  }
}

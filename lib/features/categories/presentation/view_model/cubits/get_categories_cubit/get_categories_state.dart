part of 'get_categories_cubit.dart';

@immutable
abstract class GetCategoriesState {}

class GetCategoriesInitial extends GetCategoriesState {}
class GetCategoriesSuccess extends GetCategoriesState {
  final List<CategoryModel> categories;

  GetCategoriesSuccess(this.categories);
}
class GetCategoriesFailure extends GetCategoriesState {
 final String errMessage;

  GetCategoriesFailure(this.errMessage);
}

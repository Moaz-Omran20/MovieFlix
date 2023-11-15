part of 'get_categories_cubit.dart';

@immutable
abstract class GetCategoriesState {}

class GetCategoriesInitial extends GetCategoriesState {}
class GetCategoriesSuccess extends GetCategoriesState {
  List<CategoryModel> categories;

  GetCategoriesSuccess(this.categories);
}
class GetCategoriesFailure extends GetCategoriesState {
  String errMessage;

  GetCategoriesFailure(this.errMessage);
}

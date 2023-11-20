part of 'top_casts_cubit.dart';

@immutable
abstract class TopCastsState {}

class TopCastsInitial extends TopCastsState {}
class TopCastsSuccess extends TopCastsState {
  List<TopCastModel>topCasts;

  TopCastsSuccess(this.topCasts);
}
class TopCastsLoading extends TopCastsState {}
class TopCastsFailure extends TopCastsState {
  String errMessage;

  TopCastsFailure(this.errMessage);
}

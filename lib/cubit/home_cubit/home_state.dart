import 'package:ecommerce_app/model/api_home.dart';

abstract class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateSuccessful extends HomeState {
  final HomeModel homeModel;
  HomeStateSuccessful(this.homeModel);
}

class HomeStateError extends HomeState {
  final String errorMessage;
  HomeStateError({required this.errorMessage});
}

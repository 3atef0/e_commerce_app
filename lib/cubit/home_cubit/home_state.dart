import 'package:ecommerce_app/model/api_categorie.dart';
import 'package:ecommerce_app/model/api_home.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final HomeModel homeModel;
  final CategoriesModel2 categoriesModel;
  HomeSuccessState(this.homeModel, this.categoriesModel);
}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState(this.error);
}

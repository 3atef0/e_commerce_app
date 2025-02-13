import 'package:ecommerce_app/model/api_categorie_details.dart';

abstract class CategoryDetailsState {}

class CategoryDetailsInitial extends CategoryDetailsState {}

class CategoryDetailsLoadingState extends CategoryDetailsState {}

class CategoryDetailsSuccessState extends CategoryDetailsState {
  final CategoryDetailsModel categoryDetailsModel;
  CategoryDetailsSuccessState(this.categoryDetailsModel);
}

class CategoryDetailsErrorState extends CategoryDetailsState {
  final String error;
  CategoryDetailsErrorState(this.error);
}

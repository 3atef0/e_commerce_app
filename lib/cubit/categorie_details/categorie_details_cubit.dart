import 'package:dio/dio.dart';

import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/cubit/categorie_details/categorie_details_state.dart';
import 'package:ecommerce_app/model/api_categorie_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
  CategoryDetailsCubit() : super(CategoryDetailsInitial());

  static CategoryDetailsCubit get(context) => BlocProvider.of(context);

  CategoryDetailsModel? categoryDetailsModel;

  void getCategoryDetails(int categoryId) async {
    emit(CategoryDetailsLoadingState());
    try {
      Response response =
          await Dio().get("${ApiConstants.categorie}/$categoryId");
      categoryDetailsModel = CategoryDetailsModel.fromJson(response.data);
      emit(CategoryDetailsSuccessState(categoryDetailsModel!));
    } catch (e) {
      emit(CategoryDetailsErrorState(e.toString()));
    }
  }
}

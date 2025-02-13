import 'package:dio/dio.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/cubit/home_cubit/home_state.dart';
import 'package:ecommerce_app/model/api_categorie.dart';
import 'package:ecommerce_app/model/api_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  HomeModel? homeModel;
  CategoriesModel2? categoriesModel;

  void getHomeData() async {
    emit(HomeLoadingState());
    try {
      Response homeResponse = await Dio().get(ApiConstants.home);
      Response categoriesResponse = await Dio().get(ApiConstants.categorie);

      homeModel = HomeModel.fromJson(homeResponse.data);
      categoriesModel = CategoriesModel2.fromJson(categoriesResponse.data);

      emit(HomeSuccessState(homeModel!, categoriesModel!));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}

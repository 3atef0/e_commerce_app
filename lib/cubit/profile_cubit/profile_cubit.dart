import 'package:dio/dio.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/cubit/profile_cubit/profile_state.dart';
import 'package:ecommerce_app/model/api_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  void fetchData() async {
    emit(ProfileLoading());
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('user_token');

      var response = await Dio().get(
        ApiConstants.profile, // This is the correct endpoint
        options: Options(
          headers: {
            "Authorization": "$token",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        ProfileModel profileModel = ProfileModel.fromJson(response.data);
        emit(ProfileLoaded(profileModel));
      } else {
        emit(ProfileError("Unexpected error: ${response.statusCode}"));
      }
    } on DioException catch (error) {
      if (error.response != null) {
        if (error.response!.statusCode == 400) {
          emit(ProfileError("Invalid login credentials. Try again."));
        } else if (error.response!.statusCode == 404) {
          emit(ProfileError("Server not found. Try again later."));
        } else if (error.response!.statusCode == 500) {
          emit(ProfileError("Server error. Please try again later."));
        } else {
          emit(ProfileError("Error: ${error.response!.statusCode}"));
        }
      } else {
        emit(ProfileError("Network error. Check your connection."));
      }
    } catch (error) {
      emit(ProfileError("An unexpected error occurred: $error"));
    }
  }
}

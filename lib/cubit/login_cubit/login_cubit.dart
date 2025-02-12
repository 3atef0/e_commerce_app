import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/model/api_login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit() : super(LoginCubitInitial());
  static LoginCubitCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());

    try {
      var response = await Dio().post(
        ApiConstants.login,
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginModel loginModel = LoginModel.fromJson(response.data);
        emit(SignInSuccessful(loginModel));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_token', loginModel.data!.token);
        print(loginModel.data!.token);
      } else {
        emit(SignInFailure("Unexpected error: ${response.statusCode}"));
      }
    } on DioException catch (error) {
      if (error.response != null) {
        if (error.response!.statusCode == 400) {
          emit(SignInFailure("Invalid login credentials. Try again."));
        } else if (error.response!.statusCode == 404) {
          emit(SignInFailure("Server not found. Try again later."));
        } else if (error.response!.statusCode == 500) {
          emit(SignInFailure("Server error. Please try again later."));
        } else {
          emit(SignInFailure("Error: ${error.response!.statusCode}"));
        }
      } else {
        emit(SignInFailure("Network error. Check your connection."));
      }
    } catch (error) {
      emit(SignInFailure("An unexpected error occurred: $error"));
    }
  }
}

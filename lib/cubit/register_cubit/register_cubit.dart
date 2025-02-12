import 'package:dio/dio.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/model/api_register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterCubit() : super(RegisterCubitInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  void userRegister(
      {required String name,
      String? phone,
      required String email,
      required String password}) async {
    emit(SignUpLoading());
    try {
      var response = await Dio().post(
        ApiConstants.register,
        data: {
          'name': name,
          'phone': '01117871350',
          'email': email,
          'password': password,
          "image":
              "https://img.freepik.com/free-vector/isolated-young-handsome-man-different-poses-white-background-illustration_632498-859.jpg?t=st=1738695804~exp=1738699404~hmac=907da3722d5a50129709e327874a9e25e784f10b19c6f544ba059af56bca6118&w=1060",
        },
      );
      RegisterModel registerModel = RegisterModel.fromJson(response.data);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_token', registerModel.data!.token);
      print(response.data);
      emit(SignUpSuccessful(registerModel));
      print(registerModel.data!.email);
    } catch (e) {
      SignUpFailure(e.toString());
    }
  }
}

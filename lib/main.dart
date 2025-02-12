import 'package:ecommerce_app/cubit/home_cubit/home_cubit.dart';
import 'package:ecommerce_app/cubit/layout_cubit/layout_cubit.dart';
import 'package:ecommerce_app/cubit/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/cubit/profile_cubit/profile_cubit.dart';
import 'package:ecommerce_app/cubit/register_cubit/register_cubit.dart';
import 'package:ecommerce_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LayoutCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubitCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

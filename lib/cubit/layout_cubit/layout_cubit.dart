import 'package:ecommerce_app/cubit/layout_cubit/layout_state.dart';
import 'package:ecommerce_app/features/account_screen.dart';
import 'package:ecommerce_app/features/cart_screen.dart';
import 'package:ecommerce_app/features/explore_screen.dart';
import 'package:ecommerce_app/features/home_screen.dart';
import 'package:ecommerce_app/features/offer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super((LayoutInitialState()));
  static LayoutCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    HomeScreen(),
    const ExploreScreen(),
    const CartScreen(),
    const OfferScreen(),
    const AccountScreen()
  ];

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit((LayoutChangeButtonState()));
  }
}

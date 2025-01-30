import 'package:e_commerc/features/main_layout/cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../categories/presentation/categories_tab.dart';
import '../favourite/presentation/favourite_screen.dart';
import '../home/presentation/home_tab.dart';
import '../profile_tab/presentation/profile_tab.dart';

class HomeViewModel extends Cubit<HomeStates>{
  HomeViewModel() : super(HomeInitialState());

  // todo : holed data - handel logic
  int currentIndex = 0;
  List<Widget> tabs = [
     HomeTab(),
     CategoriesTab(),
     FavouriteScreen(),
     ProfileTab(),
  ];
  changeSelectedIndex(int selectedIndex) {
    emit(HomeInitialState());
      currentIndex = selectedIndex;
      emit(ChangeSelectedIndexState());
  }
}
import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerc/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerc/domain/use_cases/get_all_category_use_case.dart';
import 'package:e_commerc/features/main_layout/home/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core/resources/assets_manager.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllBrandsUseCase getAllBrandsUseCase;
  GetAllCategoryUseCase getAllCategoryUseCase;

  HomeTabViewModel(
      {required this.getAllCategoryUseCase, required this.getAllBrandsUseCase})
      : super(HomeInitialState());

  List<CategoryOrBrandDataEntity> categoryList = [];
  List<CategoryOrBrandDataEntity> brandsList = [];
  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];


  static HomeTabViewModel get(context) => BlocProvider.of(context);


  void getAllCategory() async {
    emit(HomeCategoryLoadingState());
    var either = await getAllCategoryUseCase.invoke();
    either.fold((error) => emit(HomeCategoryErrorState(failures: error)),
        (response) {
      categoryList = response.data ?? [];
      print(categoryList);
      if (brandsList.isNotEmpty) {
        emit(HomeCategorySuccessState(responseEntity: response));
      }
    });
  }

  void getAllBrands() async {
    emit(HomeBrandsLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    either.fold((error) => Left(emit(HomeBrandsErrorState(failures: error))),
        (response) {
      brandsList = response.data ?? [];

      if (categoryList.isNotEmpty) {
        emit(HomeBrandsSuccessState(responseEntity: response));
      }
    });
  }
}

import 'package:e_commerc/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerc/domain/entities/GetSubCategoriesResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';

abstract class CategoryTabStates {}

class GetCategoriesInitialState extends CategoryTabStates {}

class GetCategoriesLoadingState extends CategoryTabStates {}

class GetCategoriesErrorState extends CategoryTabStates {
  Failures failures;

  GetCategoriesErrorState({required this.failures});
}

class GetCategoriesSuccessState extends CategoryTabStates {
  CategoryOrBrandResponseEntity categoriesOrBrandsResponseEntity;

  GetCategoriesSuccessState({required this.categoriesOrBrandsResponseEntity});
}

class ChangeNewCategoryState extends CategoryTabStates {}

class CategorySelectedIndex extends CategoryTabStates {
  final int selectedIndex;

  CategorySelectedIndex({required this.selectedIndex});
}

/// todo: States Sub Categories
class GetSUbCategoriesLoadingState extends CategoryTabStates {}

class GetSubCategoriesErrorState extends CategoryTabStates {
  Failures failures;

  GetSubCategoriesErrorState({required this.failures});
}

class GetSubCategoriesSuccessState extends CategoryTabStates {
  GetSubCategoriesResponseEntity getSubCategoriesResponseEntity;

  GetSubCategoriesSuccessState({required this.getSubCategoriesResponseEntity});
}

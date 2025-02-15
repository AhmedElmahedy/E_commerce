import 'package:e_commerc/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';

abstract class HomeTabStates {}
class HomeInitialState extends HomeTabStates{}
class HomeCategoryLoadingState extends HomeTabStates{}
class HomeCategoryErrorState extends HomeTabStates{
  Failures failures;
  HomeCategoryErrorState({required this.failures});
}
class HomeCategorySuccessState extends HomeTabStates{
  CategoryOrBrandResponseEntity responseEntity;
  HomeCategorySuccessState({required this.responseEntity});
}



class HomeBrandsLoadingState extends HomeTabStates{}
class HomeBrandsErrorState extends HomeTabStates{
  Failures failures;
  HomeBrandsErrorState({required this.failures});
}
class HomeBrandsSuccessState extends HomeTabStates{
  CategoryOrBrandResponseEntity responseEntity;
  HomeBrandsSuccessState({required this.responseEntity});
}
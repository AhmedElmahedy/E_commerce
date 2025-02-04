import 'package:e_commerc/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerc/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';

abstract class ProductsStates {}
class ProductsInitialState extends ProductsStates{}
class ProductsLoadingState extends ProductsStates{}
class ProductsErrorState extends ProductsStates{
  Failures failures;
  ProductsErrorState({required this.failures});
}
class ProductsSuccessState extends ProductsStates{
  ProductResponseEntity responseEntity;
  ProductsSuccessState({required this.responseEntity});

}



class AddToCartLoadingState extends ProductsStates{}
class AddToCartErrorState extends ProductsStates{
  Failures failures;
  AddToCartErrorState({required this.failures});
}
class AddToCartSuccessState extends ProductsStates{
  AddToCartResponseEntity responseEntity;
  AddToCartSuccessState({required this.responseEntity});

}


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


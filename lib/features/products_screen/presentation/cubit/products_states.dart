import 'package:e_commerc/domain/entities/AddProductsWishlistResponseEntity.dart';
import 'package:e_commerc/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerc/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';

abstract class ProductsStates {}

class ProductsInitialState extends ProductsStates {}

// todo: products states
class ProductsLoadingState extends ProductsStates {}

class ProductsErrorState extends ProductsStates {
  Failures failures;

  ProductsErrorState({required this.failures});
}

class ProductsSuccessState extends ProductsStates {
  ProductResponseEntity responseEntity;

  ProductsSuccessState({required this.responseEntity});
}

// todo: Add products wishlist states

class AddProductWishlistLoadingState extends ProductsStates {
  String productId;
  AddProductWishlistLoadingState({required this.productId});
}

class AddProductWishlistErrorState extends ProductsStates {
  Failures failures;
  String productId;

  AddProductWishlistErrorState({required this.failures,required this.productId});
}

class AddProductWishlistSuccessState extends ProductsStates {
  AddProductsWishlistResponseEntity addProductsWishlistResponseEntity;
  String productId;
  AddProductWishlistSuccessState({required this.addProductsWishlistResponseEntity,required this.productId});
}
// todo: add to cart states

class AddToCartLoadingState extends ProductsStates {}

class AddToCartErrorState extends ProductsStates {
  Failures failures;

  AddToCartErrorState({required this.failures});
}

class AddToCartSuccessState extends ProductsStates {
  AddToCartResponseEntity responseEntity;

  AddToCartSuccessState({required this.responseEntity});
}

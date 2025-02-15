import 'package:e_commerc/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';

abstract class FavouriteStates {}
class FavouriteInitialState extends FavouriteStates{}
class FavouriteLoadingState extends FavouriteStates{}
class FavouriteErrorState extends FavouriteStates{
  Failures failures;
  FavouriteErrorState({required this.failures});
}
class FavouriteSuccessState extends FavouriteStates{
  ProductResponseEntity productResponseEntity;
  FavouriteSuccessState({required this.productResponseEntity});
}
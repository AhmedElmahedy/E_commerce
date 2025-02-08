import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerc/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerc/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId);
}

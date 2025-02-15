import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/entities/AddProductsWishlistResponseEntity.dart';

import '../../../../domain/entities/ProductResponseEntity.dart';
import '../../../../domain/failures.dart';

abstract class GetProductsRemoteDataSource {
  Future<Either<Failures, ProductResponseEntity>> getProductsFromCategory(String categoryId);
  Future<Either<Failures, AddProductsWishlistResponseEntity>> addWishlist(String productId);
  Future<Either<Failures, ProductResponseEntity>> getProductsWishlist();


}
import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/entities/AddProductsWishlistResponseEntity.dart';

import '../entities/ProductResponseEntity.dart';
import '../failures.dart';

abstract class GetProductsRepository {
  Future<Either<Failures, ProductResponseEntity>> getProductsFromCategory(String categoryId);
  Future<Either<Failures, AddProductsWishlistResponseEntity>> addWishlist(String productId);
}

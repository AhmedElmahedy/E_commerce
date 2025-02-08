import 'package:dartz/dartz.dart';

import '../entities/ProductResponseEntity.dart';
import '../failures.dart';

abstract class GetProductsRepository {
  Future<Either<Failures, ProductResponseEntity>> getProductsFromCategory(String categoryId);
}

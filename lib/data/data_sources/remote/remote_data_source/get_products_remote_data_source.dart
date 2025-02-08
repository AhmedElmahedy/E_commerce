import 'package:dartz/dartz.dart';

import '../../../../domain/entities/ProductResponseEntity.dart';
import '../../../../domain/failures.dart';

abstract class GetProductsRemoteDataSource {
  Future<Either<Failures, ProductResponseEntity>> getProductsFromCategory(String categoryId);

}
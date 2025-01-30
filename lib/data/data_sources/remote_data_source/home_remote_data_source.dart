import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/entities/CategoriesOrBrandsResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getAllCategories();
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getAllBrands();
}

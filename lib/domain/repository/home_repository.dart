import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/entities/CategoriesOrBrandsResponseEntity.dart';
import 'package:e_commerc/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';

abstract class HomeRepository {
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getAllCategories();
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getAllBrands();
  Future<Either<Failures, ProductResponseEntity>> getAllProducts();
}
import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/entities/GetSubCategoriesResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';

abstract class GetSubCategoriesRemoteDataSource {

  Future<Either<Failures,GetSubCategoriesResponseEntity>> getSubCategories(String id);
}
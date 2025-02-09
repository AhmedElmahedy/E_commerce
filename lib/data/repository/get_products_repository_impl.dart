import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';
import 'package:e_commerc/domain/repository/get_products_repository.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/remote/remote_data_source/get_products_remote_data_source.dart';
@Injectable(as: GetProductsRepository)
class GetProductsRepositoryImpl implements GetProductsRepository {
  GetProductsRemoteDataSource getProductsRemoteDataSource;

  GetProductsRepositoryImpl({required this.getProductsRemoteDataSource});

  @override
  Future<Either<Failures, ProductResponseEntity>> getProductsFromCategory(
      String categoryId) async {
    // TODO: implement getProductsFromCategory
    var either =
        await getProductsRemoteDataSource.getProductsFromCategory(categoryId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}

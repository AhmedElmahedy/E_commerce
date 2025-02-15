import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerc/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';
import 'package:e_commerc/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/remote/remote_data_source/home_remote_data_source.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>>
      getAllCategory() async {
    // TODO: implement getAllCategories
    var either = await homeRemoteDataSource.getAllCategories();

    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>>
      getAllBrands() async {
    // TODO: implement getAllBrands
    var either = await homeRemoteDataSource.getAllBrands();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addTOCart(String productId)async {
    // TODO: implement addTOCart
    var either = await homeRemoteDataSource.addToCart(productId);
    return either.fold((error)=> Left(error), (response)=> Right(response));
  }
}

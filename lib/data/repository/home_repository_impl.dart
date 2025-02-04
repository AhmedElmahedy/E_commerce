import 'package:dartz/dartz.dart';
import 'package:e_commerc/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:e_commerc/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerc/domain/entities/CategoriesOrBrandsResponseEntity.dart';
import 'package:e_commerc/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';
import 'package:e_commerc/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>>
      getAllCategories() async {
    // TODO: implement getAllCategories
    var either = await homeRemoteDataSource.getAllCategories();

    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>>
      getAllBrands() async {
    // TODO: implement getAllBrands
    var either = await homeRemoteDataSource.getAllBrands();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() async {
    // TODO: implement getAllProducts
    var either = await homeRemoteDataSource.getAllProducts();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addTOCart(String productId)async {
    // TODO: implement addTOCart
    var either = await homeRemoteDataSource.addToCart(productId);
    return either.fold((error)=> Left(error), (response)=> Right(response));
  }
}

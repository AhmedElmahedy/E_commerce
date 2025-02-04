import 'package:dartz/dartz.dart';
import 'package:e_commerc/data/data_sources/remote_data_source/get_cart_remote_data_source.dart';
import 'package:e_commerc/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';
import 'package:e_commerc/domain/repository/get_cart_repository.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: GetCartRepository)
class GetCartRepositoryImpl implements GetCartRepository {
  GetCartRemoteDataSource getCartRemoteDataSource;

  GetCartRepositoryImpl({required this.getCartRemoteDataSource});

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() async {
    // TODO: implement getCart
    var either = await getCartRemoteDataSource.getCart();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(String productId)async {
    // TODO: implement deleteItemInCart
    var either = await getCartRemoteDataSource.deleteItemInCart(productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCountItemInCart(String productId, int count) async{
    // TODO: implement updateCountItemInCart
    var either = await getCartRemoteDataSource.updateCountItemInCart(productId, count);
    return either.fold((error)=> Left(error),
        (response)=> Right(response));
  }
}

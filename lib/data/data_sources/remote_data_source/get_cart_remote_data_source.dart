import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';

abstract class GetCartRemoteDataSource {
  Future<Either<Failures, GetCartResponseEntity>> getCart();
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(String productId);
  Future<Either<Failures, GetCartResponseEntity>> updateCountItemInCart(String productId,int count);
}
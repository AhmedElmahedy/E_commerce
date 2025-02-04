import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/repository/get_cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/GetCartResponseEntity.dart';
import '../failures.dart';

@injectable
class DeleteItemInCartUseCase{
  GetCartRepository getCartRepository;
  DeleteItemInCartUseCase ({required this.getCartRepository});
  Future<Either<Failures, GetCartResponseEntity>> invoke(String productId){
   return getCartRepository.deleteItemInCart(productId);
  }
}
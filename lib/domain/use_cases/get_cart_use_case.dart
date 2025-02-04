import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/repository/get_cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/GetCartResponseEntity.dart';
import '../failures.dart';

@injectable
class GetCartUseCase {
  GetCartRepository getCartRepository;
  GetCartUseCase ({required this.getCartRepository});
  Future<Either<Failures, GetCartResponseEntity>> invoke(){
   return getCartRepository.getCart();
  }
}
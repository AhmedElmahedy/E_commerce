import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerc/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerc/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';

@injectable
class AddToCartUseCase {
  HomeRepository homeRepository;
  AddToCartUseCase({required this.homeRepository});

  Future<Either<Failures, AddToCartResponseEntity>> invoke(String productId){
    return homeRepository.addTOCart(productId);
  }
}
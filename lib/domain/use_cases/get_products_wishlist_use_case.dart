import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/entities/AddProductsWishlistResponseEntity.dart';
import 'package:e_commerc/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerc/domain/repository/get_products_repository.dart';
import 'package:e_commerc/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';

@injectable
class GetProductsWishlistUseCase {
  GetProductsRepository getProductsRepository;
  GetProductsWishlistUseCase({required this.getProductsRepository});

  Future<Either<Failures, ProductResponseEntity>> invoke(){
    return getProductsRepository.getProductsWishlist();
  }
}
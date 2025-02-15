import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/repository/get_products_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/AddProductsWishlistResponseEntity.dart';
import '../failures.dart';
@injectable
class AddProductsWishlistUseCase {
  GetProductsRepository getProductsRepository;

  AddProductsWishlistUseCase({required this.getProductsRepository});

  Future<Either<Failures, AddProductsWishlistResponseEntity>> addWishlist(
      String productId) {
    return getProductsRepository.addWishlist(productId);
  }
}

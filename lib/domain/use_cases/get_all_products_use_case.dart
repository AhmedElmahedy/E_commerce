import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerc/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/CategoriesOrBrandsResponseEntity.dart';
import '../failures.dart';

@injectable
class GetAllProductsUseCase {
  HomeRepository homeRepository;
  GetAllProductsUseCase({required this.homeRepository});

  Future<Either<Failures, ProductResponseEntity>> invoke(){
    return homeRepository.getAllProducts();
  }
}
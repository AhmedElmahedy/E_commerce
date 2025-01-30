import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/CategoriesOrBrandsResponseEntity.dart';
import '../failures.dart';

@injectable
class GetAllBrandsUseCase {
  HomeRepository homeRepository;
  GetAllBrandsUseCase({required this.homeRepository});

  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> invoke(){
    return homeRepository.getAllBrands();
  }
}
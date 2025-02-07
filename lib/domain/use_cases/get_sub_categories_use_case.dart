import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/entities/GetSubCategoriesResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';
import 'package:e_commerc/domain/repository/get_sub_categories_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetSubCategoriesUseCase {
  GetSubCategoriesRepository getSubCategoriesRepository;

  GetSubCategoriesUseCase({required this.getSubCategoriesRepository});

  Future<Either<Failures,GetSubCategoriesResponseEntity>>invoke(String id) async {
  var either = await getSubCategoriesRepository.getSubCategories(id);
  return either.fold((error)=>Left(error),
      (response)=>Right(response));
  }
}

import 'package:dartz/dartz.dart';
import 'package:e_commerc/data/data_sources/remote_data_source/get_sub_categories_remote_data_source.dart';
import 'package:e_commerc/domain/entities/GetSubCategoriesResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';
import 'package:e_commerc/domain/repository/get_sub_categories_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:GetSubCategoriesRepository )
class GetSubCategoriesRepositoryImpl implements GetSubCategoriesRepository {
  GetSubCategoriesRemoteDataSource getSubCategoriesRemoteDataSource;
  GetSubCategoriesRepositoryImpl({required this.getSubCategoriesRemoteDataSource});
  @override
  Future<Either<Failures, GetSubCategoriesResponseEntity>> getSubCategories(String id)async {
    // TODO: implement getSubCategories
    var either = await getSubCategoriesRemoteDataSource.getSubCategories(id);

   return either.fold((error)=> Left(error),
        (response)=> Right(response));
  }
}
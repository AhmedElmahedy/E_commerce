import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerc/data/api_manager.dart';
import 'package:e_commerc/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:e_commerc/data/end_point.dart';
import 'package:e_commerc/data/model/CategoriesOrBrandsResponseDto.dart';
import 'package:e_commerc/data/model/ProductResponseDto.dart';
import 'package:e_commerc/domain/entities/CategoriesOrBrandsResponseEntity.dart';
import 'package:e_commerc/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseDto>>
      getAllCategories() async {
    // TODO: implement getAllCategories
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var response = await apiManager.getData(EndPoint.getAllCategory);
        var getAllCategoryResponse =
            CategoriesOrBrandsResponseDto.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllCategoryResponse);
        } else {
          return Left(
              ServerError(errorMessage: getAllCategoryResponse.message!));
        }
      } else {
        // No internet
        return Left(NetworkError(
            errorMessage: 'No Internet Connection , Please Check Internet'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>>
      getAllBrands() async {
    // TODO: implement getAllBrands
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var response = await apiManager.getData(EndPoint.getAllBrands);
        var getAllBrandsResponse =
            CategoriesOrBrandsResponseDto.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllBrandsResponse);
        } else {
          return Left(ServerError(errorMessage: getAllBrandsResponse.message!));
        }
      } else {
        // No internet
        return Left(NetworkError(
            errorMessage: 'No Internet Connection , Please Check Internet'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() async{
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var response = await apiManager.getData(EndPoint.getAllProducts);
        var getAllProductsResponse =
        ProductResponseDto.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllProductsResponse);
        } else {
          return Left(ServerError(errorMessage: getAllProductsResponse.message!));
        }
      } else {
        // No internet
        return Left(NetworkError(
            errorMessage: 'No Internet Connection , Please Check Internet'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }  }
}

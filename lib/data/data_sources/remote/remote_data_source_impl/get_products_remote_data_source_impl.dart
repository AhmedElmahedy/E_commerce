import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerc/data/api_manager.dart';
import 'package:e_commerc/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../../../end_point.dart';
import '../../../model/ProductResponseDto.dart';
import '../remote_data_source/get_products_remote_data_source.dart';
@Injectable(as: GetProductsRemoteDataSource)
class GetProductsRemoteDataSourceImpl  implements GetProductsRemoteDataSource{
  ApiManager apiManager;
  GetProductsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, ProductResponseDto>> getProductsFromCategory(String categoryId)async {
    // TODO: implement getProductsFromCategory
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var response = await apiManager.getData(EndPoint.getAllProducts,
            queryParameters:{
              "category[in]" : categoryId
        } );
        var getAllProductsResponse = ProductResponseDto.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllProductsResponse);
        } else {
          return Left(
              ServerError(errorMessage: getAllProductsResponse.message!));
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
}